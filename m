Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E2F117057
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2019 16:25:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfLIPZg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Dec 2019 10:25:36 -0500
Received: from muru.com ([72.249.23.125]:44512 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfLIPZf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 9 Dec 2019 10:25:35 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2FF0580CD;
        Mon,  9 Dec 2019 15:26:13 +0000 (UTC)
Date:   Mon, 9 Dec 2019 07:25:31 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>, maemo-leste@lists.dyne.org
Subject: Re: N900 off mode
Message-ID: <20191209152531.GI35479@atomide.com>
References: <d5a115d9-858d-3f04-cbb4-2809cbdcfdc8@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5a115d9-858d-3f04-cbb4-2809cbdcfdc8@wizzup.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Merlijn Wajer <merlijn@wizzup.org> [191209 02:32]:
> I'm trying to figure out how I can try get my Nokia N900 to go into off
> mode.
...

> BTW, the kernel is patched with SGX support, so that may have something
> to do with it, but it seems to actually be idle, if I am reading
> pm_debug/count correctly. [2]

OK that's good to hear :)

> # cat idle.sh
> #!/bin/sh
> 
> export UART_IDLE_MS=5000
> idle_uarts() {
>         # Enable autosuspend
>         uarts=$(find /sys/bus/platform/devices/*.serial/power/ -type d)
>         for uart in ${uarts}; do
>                 echo -n ${UART_IDLE_MS} > ${uart}/autosuspend_delay_ms
>                 echo -n enabled > ${uart}/wakeup
>                 echo -n auto > ${uart}/control
>         done
> 
>         # Configure wake-up from suspend
>         uarts=$(find /sys/class/tty/tty[SO]*/power/ -type d 2>/dev/null)
>         for uart in ${uarts}; do
>                 echo -n enabled > ${uart}/wakeup
>         done
> }
> 
> idle_uarts
> 
> mount -t debugfs debugfs /sys/kernel/debug
> echo 1 > /sys/kernel/debug/pm_debug/enable_off_mode

The above should do the right thing.

> [2] # cat /sys/kernel/debug/pm_debug/count
> usbhost_pwrdm
> (ON),OFF:0,RET:670,INA:0,ON:671,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
> sgx_pwrdm (OFF),OFF:24,RET:0,INA:0,ON:24,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0

Yup sgx_pwrdm above looks good.

> core_pwrdm
> (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0
> per_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0

Here per_pwrdm has some device(s) blocking idle for both per and core.

Below is my old debug patch that provides more info on the blocking
bits. It's probably some cm_idlest_per bit(s) that's blocking compared
to the known good 00010000 and 00000042 values.

Care to try it and reply with the cm_idlest_per and cm_idlest1_core
values you're seeing?

I've checked that n900 idles fine for me with omap2plus_defconfig
and minimal user space for v5.4.

Regards,

Tony

8< -----------------------
Allows seeing the deeper idle state blockers in
/sys/kernel/debug/pm_debug/count. For example, when
off idle is working on beaglboard xm, this is what
i see:

# sleep 5; cat /sys/kernel/debug/pm_debug/count
...
0006ffff 48005020 (fa005020) cm_idlest_per blocking bits: 00010000
e7ffffbd 48004a20 (fa004a20) cm_idlest1_core blocking bits: 00000042
0000000d 48004a28 (fa004a28) cm_idlest3_core
---
 arch/arm/mach-omap2/pm-debug.c | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/mach-omap2/pm-debug.c b/arch/arm/mach-omap2/pm-debug.c
--- a/arch/arm/mach-omap2/pm-debug.c
+++ b/arch/arm/mach-omap2/pm-debug.c
@@ -136,10 +136,78 @@ static int pwrdm_dbg_show_timer(struct powerdomain *pwrdm, void *user)
 	return 0;
 }
 
+#include "iomap.h"
+
+struct dregs {
+	const char	*desc;
+	u32		phys;
+	void __iomem	*virt;
+	u32		mask;
+};
+
+#define PER_CM_BASE	0x48005000
+#define PER_CM_REG(name, offset, mask)				\
+	{ name, PER_CM_BASE + offset,				\
+	OMAP2_L4_IO_ADDRESS(PER_CM_BASE + offset), mask, }
+
+static struct dregs cm_per[] = {
+	PER_CM_REG("cm_idlest_per", 0x20, 0xfff80000), /* p 513 */
+	{ NULL, },
+};
+
+#define CORE_CM_BASE	0x48004a00
+#define CORE_CM_REG(name, offset, mask)				\
+	{ name, CORE_CM_BASE + offset,				\
+	OMAP2_L4_IO_ADDRESS(CORE_CM_BASE + offset), mask, }
+
+static struct dregs cm_core[] = {
+	CORE_CM_REG("cm_idlest1_core", 0x20, 0x9c800109), /* p 467 */
+	CORE_CM_REG("cm_idlest3_core", 0x28, 0xfffffffb),
+	{ NULL, },
+};
+
+void __dregs_dump(struct dregs *dregs, struct seq_file *s)
+{
+	for (; dregs->desc; dregs++) {
+		u32 val, blockers;
+
+		val = __raw_readl(dregs->virt);
+
+		seq_printf(s, "%08x %08x (%p) %s",
+			   val, dregs->phys, dregs->virt,
+			   dregs->desc);
+
+		if (dregs->mask) {
+			blockers = ~val;
+			blockers &= ~dregs->mask;
+
+			if (blockers)
+				seq_printf(s, " blocking bits: %08x",
+					   blockers);
+		}
+
+		seq_printf(s, "\n");
+	}
+}
+
+void cm_per_dump(struct seq_file *s)
+{
+	__dregs_dump(cm_per, s);
+}
+
+void cm_core_dump(struct seq_file *s)
+{
+	__dregs_dump(cm_core, s);
+}
+
 static int pm_dbg_counters_show(struct seq_file *s, void *unused)
 {
 	pwrdm_for_each(pwrdm_dbg_show_counter, s);
 	clkdm_for_each(clkdm_dbg_show_counter, s);
+	if (cpu_is_omap34xx()) {
+		cm_per_dump(s);
+		cm_core_dump(s);
+	}
 
 	return 0;
 }
-- 
2.24.0

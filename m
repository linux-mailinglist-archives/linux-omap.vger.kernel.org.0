Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2862F5B33
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jan 2021 08:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbhANHVZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jan 2021 02:21:25 -0500
Received: from muru.com ([72.249.23.125]:44758 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727174AbhANHVY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Jan 2021 02:21:24 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 366D7811B;
        Thu, 14 Jan 2021 07:20:43 +0000 (UTC)
Date:   Thu, 14 Jan 2021 09:20:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3
 l4_wkup
Message-ID: <X//wx/oSTpXKpY75@atomide.com>
References: <20201026112222.56894-1-tony@atomide.com>
 <20201026112222.56894-14-tony@atomide.com>
 <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com>
 <X/8ei0o9ULpRdx7T@atomide.com>
 <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
 <X/8kDzoADvcnNHxC@atomide.com>
 <X/8tz/2v4bnbF0TZ@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/8tz/2v4bnbF0TZ@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210113 17:30]:
> * Tony Lindgren <tony@atomide.com> [210113 16:48]:
> > * Geert Uytterhoeven <geert@linux-m68k.org> [210113 16:42]:
> > > On Wed, Jan 13, 2021 at 5:23 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > Strange, bbb has been working for me with NFSroot, that's with
> > > > omap2plus_defconfig. Care to send your .config so I can give it a
> > > > try tomorrow?
> > > 
> > > Sent by private email.
> > 
> > OK thanks.
> > 
> > > Just tried omap2plus_defconfig, and it also hangs during boot.
> 
> Hmm and I just tried and bbb still boots NFSroot for me at commit
> 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup").
> 
> > Hmm OK. Will give it a try tomorrow.

Not sure why your bbb would produce all the deferred probe while mine
won't.

However, I've noticed that we need the following patch on omap4/5 and
dra7 when playing with updating them to use genpd.

Maybe this also fixes your boot issue if you can give it a try?

Regards,

Tony

8< -------------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -642,6 +642,51 @@ static int sysc_parse_and_check_child_range(struct sysc *ddata)
 	return 0;
 }
 
+/* Interconnect instances to probe before l4_per instances */
+static struct resource early_bus_ranges[] = {
+	/* am3/4 l4_wkup */
+	{ .start = 0x44c00000, .end = 0x44c00000 + 0x300000, },
+	/* omap4/5 and dra7 l4_cfg */
+	{ .start = 0x4a000000, .end = 0x4a000000 + 0x300000, },
+	/* omap4 l4_wkup */
+	{ .start = 0x4a300000, .end = 0x4a300000 + 0x30000,  },
+	/* omap5 and dra7 l4_wkup without dra7 dcan segment */
+	{ .start = 0x4ae00000, .end = 0x4ae00000 + 0x30000,  },
+};
+
+static atomic_t sysc_defer = ATOMIC_INIT(10);
+
+/**
+ * sysc_defer_non_critical - defer non_critical interconnect probing
+ * @ddata: device driver data
+ *
+ * We want to probe l4_cfg and l4_wkup interconnect instances before any
+ * l4_per instances as l4_per instances depend on resources on l4_cfg and
+ * l4_wkup interconnects.
+ */
+static int sysc_defer_non_critical(struct sysc *ddata)
+{
+	struct resource *res;
+	int i;
+
+	if (!atomic_read(&sysc_defer))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(early_bus_ranges); i++) {
+		res = &early_bus_ranges[i];
+		if (ddata->module_pa >= res->start &&
+		    ddata->module_pa <= res->end) {
+			atomic_set(&sysc_defer, 0);
+
+			return 0;
+		}
+	}
+
+	atomic_dec_if_positive(&sysc_defer);
+
+	return -EPROBE_DEFER;
+}
+
 static struct device_node *stdout_path;
 
 static void sysc_init_stdout_path(struct sysc *ddata)
@@ -870,6 +915,10 @@ static int sysc_map_and_check_registers(struct sysc *ddata)
 	if (error)
 		return error;
 
+	error = sysc_defer_non_critical(ddata);
+	if (error)
+		return error;
+
 	sysc_check_children(ddata);
 
 	error = sysc_parse_registers(ddata);
-- 
2.30.0

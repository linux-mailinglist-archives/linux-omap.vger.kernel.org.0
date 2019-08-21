Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46DA096E04
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 02:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfHUAFj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Aug 2019 20:05:39 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:42087 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfHUAFi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Aug 2019 20:05:38 -0400
Received: by mail-io1-f46.google.com with SMTP id e20so969968iob.9
        for <linux-omap@vger.kernel.org>; Tue, 20 Aug 2019 17:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=LDgPPu0UFkzIh/LQg75v3L+dlV0uzWIiTZrJl4eHXzQ=;
        b=M56ZB7ESttESPptRqL+UYvCPmw8UoJ6IzKMacDxAOj3G3i3rojdxvaQPI4BFfzdY4U
         av3ULbWto32La+zHOLxVkEnwz56bxCD73N7T/732ZtyA96i3ncmm9AqVHrYVaCNi1Bwj
         wuWvJLNj6mXLmUpDZC4ibunae96P6VWS+nMV0xrq2Lc/UTDfWCbKnIO6R0JEpMHqU5mN
         eDfQommdASj/65UCQC7MneR0Ld+ToboQ6xfUXMNYlsyPZf70cstZviLi3n9WK58BebAB
         G4hj7fhoZYRsv3DfK4LPz2BI6DpCom49pqB2/J3lbs3QlG44L19fH2WqjtLs134+NVJV
         AwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LDgPPu0UFkzIh/LQg75v3L+dlV0uzWIiTZrJl4eHXzQ=;
        b=NDh4MSkS7kC2s+V30SV3r8S52pZyS/fdV80OjTzp5x2ErnJ0ssVpGYbTpNi3GXNT4k
         Jv6TLEYtz5nzndyRzzVMQfIBakWHfrMx/4PhZ5jozt/68vr+6GKc3j+br4R2BwbjwrU7
         jT/O0Vg9uQOSzO1B/jV9vhcQe0KXGlcaESGEDj3rFk68CYX4A5x7AWDDlrvDZdStl57q
         u7eZxxlDAgBgDATlS6JWQi5cBFi8b4ReTchM/JMxdlRlNXvGixCG4N6XtYLtkwrXP4Gz
         sA2063xYzjlZTKkreQd0CHxLYk7tiLdlPQ7SzV9H1j9xPcuBzdGq7+82XZqqr5DPAwYr
         cEwg==
X-Gm-Message-State: APjAAAVgGrV/OqEu9Id6YmkpwRql3YZgkTkaej77+JHX8K4DR2hzNc5Y
        QLRvV0q1RZPoElADXhV/TUY0/js+FCsYSqeKlp8+on+tnRQ=
X-Google-Smtp-Source: APXvYqwbQCwj0PYer4GT2Y69xzevmzX1nwGAmI1cBu6yWwWklkt7/53nK3au1dReu4nQjpxDsR6hhKorjaQo/59S1s4=
X-Received: by 2002:a6b:c581:: with SMTP id v123mr5393558iof.158.1566345937627;
 Tue, 20 Aug 2019 17:05:37 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 20 Aug 2019 19:05:26 -0500
Message-ID: <CAHCN7xKmQmGBig0k+gwdMax8ojoR+B3aowDOu1FyiNM3gvypKg@mail.gmail.com>
Subject: wl1271 broken on am3517-evm on for-next
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony,

I noticed the AM3517-evm gets a bunch of splat when loading the wlcore
and 80211 stuff.  It appears to be limited to your for-next branch.  I
haven not bisected it, but before I did, I wanted to see if you were
aware of anything.  If not, I'll work on bisecting it.  I just didn't
want to waste time if you had any ideas first.

thanks,

adam


[    8.726829] wlcore: WARNING Detected unconfigured mac address in nvs, derive
from fuse instead.
[    8.735761] wlcore: WARNING Your device performance is not optimized.
[    8.742319] wlcore: WARNING Please use the calibrator tool to configure your
device.
[    8.750155] ------------[ cut here ]------------
[    8.755425] WARNING: CPU: 0 PID: 72 at net/wireless/core.c:868 wiphy_register
+0x854/0xbc8 [cfg80211]
[    8.764699] Modules linked in: wl12xx wlcore mac80211 libarc4 sha256_generic
sha256_arm cfg80211 evdev joydev mousedev leds_gpio led_class phy_generic pwm_om
ap_dmtimer snd_soc_simple_card snd_soc_simple_card_utils pwm_bl cpufreq_dt bq27x
xx_battery_hdq hci_uart bq27xxx_battery btbcm omap_wdt omap_hdq watchdog wire oh
ci_platform bluetooth cn wlcore_sdio hwmon ohci_hcd snd_soc_omap_mcbsp snd_soc_t
lv320aic23_i2c snd_soc_ti_sdma snd_soc_tlv320aic23 snd_soc_core snd_pcm_dmaengin
e ehci_omap snd_pcm ecdh_generic tsc2004 ecc snd_timer ehci_hcd tsc200x_core usb
core snd usb_common soundcore gpio_pca953x
[    8.817660] CPU: 0 PID: 72 Comm: kworker/0:2 Not tainted 5.3.0-rc1-15696-g29b
aae1e8b9d #6
[    8.825883] Hardware name: Generic AM3517 (Flattened Device Tree)
[    8.832047] Workqueue: events request_firmware_work_func
[    8.837436] [<c01122d8>] (unwind_backtrace) from [<c010c8b8>] (show_stack+0x1
0/0x14)
[    8.845238] [<c010c8b8>] (show_stack) from [<c0905378>] (dump_stack+0xb4/0xd4
)
[    8.852520] [<c0905378>] (dump_stack) from [<c0139e00>] (__warn.part.3+0xa8/0
xd4)
[    8.860056] [<c0139e00>] (__warn.part.3) from [<c0139f84>] (warn_slowpath_nul
l+0x40/0x4c)
[    8.868595] [<c0139f84>] (warn_slowpath_null) from [<bf1e2548>] (wiphy_regist
er+0x854/0xbc8 [cfg80211])
[    8.878841] [<bf1e2548>] (wiphy_register [cfg80211]) from [<bf2a8df4>] (ieee8
0211_register_hw+0x4c4/0xbcc [mac80211])
[    8.889953] [<bf2a8df4>] (ieee80211_register_hw [mac80211]) from [<bf26f2d8>]
 (wlcore_nvs_cb+0x758/0xabc [wlcore])
[    8.900474] [<bf26f2d8>] (wlcore_nvs_cb [wlcore]) from [<c0654158>] (request_
firmware_work_func+0x48/0x88)
[    8.910208] [<c0654158>] (request_firmware_work_func) from [<c01549dc>] (proc
ess_one_work+0x20c/0x500)
[    8.919579] [<c01549dc>] (process_one_work) from [<c0155db8>] (worker_thread+
0x2c/0x5bc)
[    8.927729] [<c0155db8>] (worker_thread) from [<c015aab4>] (kthread+0x134/0x1
48)
[    8.935179] [<c015aab4>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c
)
[    8.942441] Exception stack(0xce609fb0 to 0xce609ff8)
[    8.947529] 9fa0:                                     00000000 00000000 00000
000 00000000
[    8.955758] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000
000 00000000
[    8.963983] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    8.970803] ---[ end trace d5056875c1e190bc ]---
[    8.975514] wlcore: ERROR unable to register mac80211 hw: -22
done

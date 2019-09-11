Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 712BFAF3B8
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 02:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfIKAlv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 20:41:51 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38000 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfIKAlv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 20:41:51 -0400
Received: by mail-io1-f67.google.com with SMTP id k5so16623953iol.5;
        Tue, 10 Sep 2019 17:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hiPLDetsTxqjF5yKEPp/XR6khdBxzbufIHLC1vYKY0k=;
        b=IzPI81XcRb1oPZ29O/rk5oQ3qTEZfnx0+hpXNsT8Tv/vOX8lyuskSQsi1ALgQxHDGS
         sSX3LZIb14gti4QC713nPVVR0L5jcR9VxeF2QBr9Mm0Ykt9Q2qc/5plIh6+gIJaULL0x
         jaUjwTJQB5mOHsBNIX0IosBxYFwyMHOtqyYTyUtqUVNL0S531eo33liLrzMfxXJ2PZ/C
         QkTDxVBTjJnZWsgZHgt3NdMEREsXmdstfT501pJ0MrkVC95qF/Fj/ZUHrNH/0HT5qYp1
         oE14bts685NGbK5Vq0JZJIPWkd8LYsPbJ1sQtHODZKStECTRBwjZf1DPC+oou4V/m5QQ
         SfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hiPLDetsTxqjF5yKEPp/XR6khdBxzbufIHLC1vYKY0k=;
        b=JNrRXMiRLljM6qK1DtVcDIT/fEY5S3tDdL3WwZ7SkzLUVWtLLUKQcH92yOZlT33JVG
         F3f71P7CWBBMaZF3icpcP4tOJInzqchXmFnHWrlv3iZ9QX2atvrsExJA+SbP/QbTycmv
         x7iMQrjrwwqEBj9tGxzwqUcWDoHCzCLMzmwfeBT/iEmC//2uEKfznmzqAcYrPdJ7417s
         hln5qR62Q9jzNFWEf/r0TOyTJ3hx58wJapDv91z1ojB2rm2YTHu1LQ7HB2nESRiyyljU
         jPYi9+Eb4HhsB1f1l8SzOUVSF2m8WrfLVhswQohzSlnehuxBZ/ZgK1lcQvHrYlx5o7pf
         oMnw==
X-Gm-Message-State: APjAAAVPD+9P9zmbuNcNqN3h81J6QApB9u1lQBr+7SB9ADkJErSbjOnm
        svYCQbmBu1KWPuxrVjyx6srZeEiI5zjLV1EmP5g=
X-Google-Smtp-Source: APXvYqxO+Kcyv1mo7Qbr98lB09sz1Ow5WkEwsww4Y2rFlemjCpM5DIlcCsr8p2R83ZWKqE2Xxm6Wubg0pdn7FufnBDY=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr7825217iod.205.1568162509659;
 Tue, 10 Sep 2019 17:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
 <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
 <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com>
 <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com>
 <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com>
 <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com> <CAHCN7x+mLCNq4evwGZfk6Ka=3o6EzhL=s38aNdukyLwKB1xO7A@mail.gmail.com>
 <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com> <2DC3BCD1-BD61-4109-9AF3-04FBD980FFB8@goldelico.com>
 <CAHCN7x++uBzYx0cK4K6CY6aveofti5TVXnqEeNKnGBy_fzm5GQ@mail.gmail.com> <CAHCN7xLPZisrNk==eF-+V8hD+sceQq25qw+sK7vVZAYdd8=Q2Q@mail.gmail.com>
In-Reply-To: <CAHCN7xLPZisrNk==eF-+V8hD+sceQq25qw+sK7vVZAYdd8=Q2Q@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 19:41:37 -0500
Message-ID: <CAHCN7xL59cXgbe1YTbNvTjptO9bMnuxprCP7ok5kRuc8UO9Fcw@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 10, 2019 at 7:24 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Tue, Sep 10, 2019 at 3:06 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Tue, Sep 10, 2019 at 2:55 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > >
> > > Ok,
> > >
> > > > Am 10.09.2019 um 20:51 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > > >
> > > >>>> it, but then I got some nasty errors and crashes.
> > > >>>
> > > >>> I have done the same but not (yet) seen a crash or error. Maybe you had
> > > >>> a typo?
> > > >>
> > > >> Can you send me an updated patch?  I'd like to try to get where you
> > > >> are that doesn't crash.
> > > >
> > > > Yes, as soon as I have access.
> > >
> > > it turns out that my patch breaks cpufreq completely...
> > > So it looks as if *I* have a typo :)
> > >
> > > Hence I am likely running at constant speed and the
> > > VDD1 regulator is fixed a 1.200V.
> > >
> > > root@letux:~# dmesg|fgrep opp
> > > [    2.426208] cpu cpu0: opp_parse_supplies: Invalid number of elements in opp-microvolt property (6) with supplies (1)
> > > [    2.438140] cpu cpu0: _of_add_opp_table_v2: Failed to add OPP, -22
> > > root@letux:~# cat /sys/class/regulator/regulator.8/microvolts
> > > 1200000
> > > root@letux:~#
> > >
> > > The error message looks as if we have to enable multi_regulator.
> >
> > That will enable both vdd and vbb regulators from what I can tell in the driver.
> >
> > > And that may need to rename cpu0-supply to vdd-supply (unless the
> > > names can be configured).
> >
> > That is consistent with what I found.  vdd-supply = <&vcc>; and
> > vbb-supply = <&abb_mpu_iva>;
> > I put them both under the cpu node.  Unfortunately, when I did that,
> > my board crashed.
> >
> > I am thinking it has something to do with the abb_mpu_iva driver
> > because until this point, we've always operated at 800MHz or lower
> > which all have the same behavior in abb_mpu_iva.
> >
> > With the patch you posted for the regulator, without the update to
> > cpufreq,  and with debugging enabled, I received the following in
> > dmesg:
> >
> > [    1.112518] ti_abb 483072f0.regulator-abb-mpu: Missing
> > 'efuse-address' IO resource
> > [    1.112579] ti_abb 483072f0.regulator-abb-mpu: [0]v=1012500 ABB=0
> > ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> > [    1.112609] ti_abb 483072f0.regulator-abb-mpu: [1]v=1200000 ABB=0
> > ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> > [    1.112609] ti_abb 483072f0.regulator-abb-mpu: [2]v=1325000 ABB=0
> > ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> > [    1.112640] ti_abb 483072f0.regulator-abb-mpu: [3]v=1375000 ABB=1
> > ef=0x0 rbb=0x0 fbb=0x0 vset=0x0
> > [    1.112731] ti_abb 483072f0.regulator-abb-mpu: ti_abb_init_timings:
> > Clk_rate=13000000, sr2_cnt=0x00000032
> >
>
> Using an unmodified kernel, I changed the device tree to make the abb
> regulator power the cpu instead of vcc.  After doing so, I was able to
> read the microvolt value, and it matched the processor's desired OPP
> voltage, and the debug code showed the abb regulator was attempting to
> set the various index based on the needed voltage.  I think the abb
> driver is working correctly.
>
> I think tomorrow, I will re-apply the patches and tweak it again to
> support both vdd and vbb regulators.  If it crashes again, I'll look
> more closely at the logs to see if I can determine why.  I think it's
> pretty close.  I also need to go back and find the SmartReflex stuff
> as well.
>
Well, I couldn't give it up for the night, so I thought I'd show my data dump

[    9.807647] ------------[ cut here ]------------
[    9.812469] WARNING: CPU: 0 PID: 68 at drivers/opp/core.c:630
dev_pm_opp_set_rate+0x3cc/0x480
[    9.821044] Modules linked in: sha256_generic sha256_arm cfg80211
joydev mousedev evdev snd_soc_omap_twl4030(+) leds_gpio led_class
panel_simple pwm_omap_dmtimer gpio_keys pwm_bl cpufreq_dt omap3_isp v
ideobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
bq27xxx_battery_hdq v4l2_fwnode snd_soc_omap_mcbsp bq27xxx_battery
snd_soc_ti_sdma omap_wdt videodev mc omap_hdq wlcore_sdio wire cn ph
y_twl4030_usb hwmon omap2430 musb_hdrc omap_mailbox twl4030_wdt
watchdog udc_core rtc_twl snd_soc_twl4030 ohci_platform(+)
snd_soc_core snd_pcm_dmaengine ohci_hcd snd_pcm ehci_omap(+)
twl4030_pwrbutton sn
d_timer twl4030_charger snd pwm_twl_led pwm_twl ehci_hcd industrialio
soundcore twl4030_keypad matrix_keymap usbcore at24 tsc2004
tsc200x_core usb_common omap_ssi hsi omapdss omapdss_base drm
drm_panel_or
ientation_quirks cec
[    9.894470] CPU: 0 PID: 68 Comm: kworker/0:2 Not tainted
5.3.0-rc3-00785-gfdfc7f21c6b7-dirty #5
[    9.903198] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[    9.909515] Workqueue: events dbs_work_handler
[    9.914031] [<c01122d8>] (unwind_backtrace) from [<c010c8b8>]
(show_stack+0x10/0x14)
[    9.921813] [<c010c8b8>] (show_stack) from [<c089e858>]
(dump_stack+0xb4/0xd4)
[    9.929107] [<c089e858>] (dump_stack) from [<c0139eb0>]
(__warn.part.3+0xa8/0xd4)
[    9.936614] [<c0139eb0>] (__warn.part.3) from [<c013a034>]
(warn_slowpath_null+0x40/0x4c)
[    9.944854] [<c013a034>] (warn_slowpath_null) from [<c06d666c>]
(dev_pm_opp_set_rate+0x3cc/0x480)
[    9.953796] [<c06d666c>] (dev_pm_opp_set_rate) from [<bf1790ac>]
(set_target+0x30/0x58 [cpufreq_dt])
[    9.963012] [<bf1790ac>] (set_target [cpufreq_dt]) from
[<c06db05c>] (__cpufreq_driver_target+0x188/0x514)
[    9.972717] [<c06db05c>] (__cpufreq_driver_target) from
[<c06de050>] (od_dbs_update+0x130/0x15c)
[    9.981567] [<c06de050>] (od_dbs_update) from [<c06deb08>]
(dbs_work_handler+0x28/0x58)
[    9.989624] [<c06deb08>] (dbs_work_handler) from [<c0154ab0>]
(process_one_work+0x20c/0x500)
[    9.998107] [<c0154ab0>] (process_one_work) from [<c0155e8c>]
(worker_thread+0x2c/0x5bc)
[   10.006256] [<c0155e8c>] (worker_thread) from [<c015ab88>]
(kthread+0x134/0x148)
[   10.013702] [<c015ab88>] (kthread) from [<c01010e8>]
(ret_from_fork+0x14/0x2c)
[   10.020965] Exception stack(0xde63bfb0 to 0xde63bff8)
[   10.026062] bfa0:                                     00000000
00000000 00000000 00000000
[   10.034271] bfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   10.042510] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   10.049224] ---[ end trace cf0e15fa4bd57700 ]---
[   10.053894] cpu cpu0: multiple regulators are not supported
[   10.059509] cpufreq: __target_index: Failed to change cpu frequency: -22



> adam
> >
> > adam
> > >
> > > BR,
> > > Nikolaus
> > >

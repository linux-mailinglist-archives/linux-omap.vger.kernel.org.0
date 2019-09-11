Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D13CAAF61D
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 08:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfIKGt5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 02:49:57 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:14140 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfIKGt5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 02:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568184593;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=IOKcEF5r5TwNp+WgofNr+b8dfxUbZgBJxZjfkaDEuIQ=;
        b=BBqsAC+KiqI5o8Ak8+dGXKl41BgahAxkDNnIaRwyCQQUrhwQIR2xq5pPRfGTo3aIhi
        yCAWEsiMSmfWROHcdCe/5EW3hLEx69hk3dcNK7x5mXzoipnnOBokDco7E00VWQ9+gReh
        EUzGtDwORRZxXhwwLDe5Nov35Pw/Mw1o/RSBJ9N6heXovZ/fL2LiVp0ocHiKW3E6WuIx
        32SVhywHBXTYZpHC2dB+NeJFv4yQHcqKEIZ25vp8JuLsXYhEyFyi2SX1TZHC5Sf0AYzd
        oJb52u4mNzVy03MYKayDdB7DmMDjg+F7NYoxPovmTKvshRGH7XRQz8VhCNcmwZ9PDrQS
        K1gQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDCvjo0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8B6nm4h6
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 11 Sep 2019 08:49:48 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <F65E947E-784A-4540-B926-BF3ECB0C01EC@goldelico.com>
Date:   Wed, 11 Sep 2019 08:49:47 +0200
Cc:     Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <285FED38-2B2B-4813-9FD2-396C53E9B1B2@goldelico.com>
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com> <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com> <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com> <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com> <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com> <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com> <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com> <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com> <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com> <CAHCN7x+mLCNq4evwGZfk6Ka=3o6EzhL=s38aNdukyLwKB1xO7A@mail.gmail.com> <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com> <2DC3 BCD1-BD61-4109-9AF3-04FBD980FFB8@goldelico.com> <CAHCN7x++uBzYx0cK4K6CY6aveofti5TVXnqEeNKnGBy_fzm5GQ@mail.gmail.com> <CAHCN7xLPZisrNk==eF-+V8hD+sceQq25qw+sK7vVZAYdd8=Q2Q@mail.gmail.com> <CAHCN7xL59cXgbe1YTbNvTjptO9bMnuxprCP7ok5kRuc8UO9Fcw@mail.gmail.com> <D7B54A39-D8A3-4EDF-8B47-66D59319B3F4@goldelico.com> <F65E947E-784A-4540-B926-BF3ECB0C01EC@goldelico.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 11.09.2019 um 08:03 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Am 11.09.2019 um 07:13 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>> Hi Adam,
>>=20
>>> Am 11.09.2019 um 02:41 schrieb Adam Ford <aford173@gmail.com>:
>>>>>>=20
>>=20
>>>>>> The error message looks as if we have to enable multi_regulator.
>>=20
>>>>>=20
>>>>> That will enable both vdd and vbb regulators from what I can tell =
in the driver.
>>>>>=20
>>>>>> And that may need to rename cpu0-supply to vdd-supply (unless the
>>>>>> names can be configured).
>>>>>=20
>>>>> That is consistent with what I found.  vdd-supply =3D <&vcc>; and
>>>>> vbb-supply =3D <&abb_mpu_iva>;
>>>>> I put them both under the cpu node.  Unfortunately, when I did =
that,
>>>>> my board crashed.
>>>>>=20
>>>>> I am thinking it has something to do with the abb_mpu_iva driver
>>>>> because until this point, we've always operated at 800MHz or lower
>>>>> which all have the same behavior in abb_mpu_iva.
>>>>>=20
>>>>> With the patch you posted for the regulator, without the update to
>>>>> cpufreq,  and with debugging enabled, I received the following in
>>>>> dmesg:
>>>>>=20
>>>>> [    1.112518] ti_abb 483072f0.regulator-abb-mpu: Missing
>>>>> 'efuse-address' IO resource
>>>>> [    1.112579] ti_abb 483072f0.regulator-abb-mpu: [0]v=3D1012500 =
ABB=3D0
>>>>> ef=3D0x0 rbb=3D0x0 fbb=3D0x0 vset=3D0x0
>>>>> [    1.112609] ti_abb 483072f0.regulator-abb-mpu: [1]v=3D1200000 =
ABB=3D0
>>>>> ef=3D0x0 rbb=3D0x0 fbb=3D0x0 vset=3D0x0
>>>>> [    1.112609] ti_abb 483072f0.regulator-abb-mpu: [2]v=3D1325000 =
ABB=3D0
>>>>> ef=3D0x0 rbb=3D0x0 fbb=3D0x0 vset=3D0x0
>>>>> [    1.112640] ti_abb 483072f0.regulator-abb-mpu: [3]v=3D1375000 =
ABB=3D1
>>>>> ef=3D0x0 rbb=3D0x0 fbb=3D0x0 vset=3D0x0
>>>>> [    1.112731] ti_abb 483072f0.regulator-abb-mpu: =
ti_abb_init_timings:
>>>>> Clk_rate=3D13000000, sr2_cnt=3D0x00000032
>>>>>=20
>>>>=20
>>>> Using an unmodified kernel, I changed the device tree to make the =
abb
>>>> regulator power the cpu instead of vcc.  After doing so, I was able =
to
>>>> read the microvolt value, and it matched the processor's desired =
OPP
>>>> voltage, and the debug code showed the abb regulator was attempting =
to
>>>> set the various index based on the needed voltage.  I think the abb
>>>> driver is working correctly.
>>>>=20
>>>> I think tomorrow, I will re-apply the patches and tweak it again to
>>>> support both vdd and vbb regulators.  If it crashes again, I'll =
look
>>>> more closely at the logs to see if I can determine why.  I think =
it's
>>>> pretty close.  I also need to go back and find the SmartReflex =
stuff
>>>> as well.
>>>>=20
>>> Well, I couldn't give it up for the night, so I thought I'd show my =
data dump
>>>=20
>>> [    9.807647] ------------[ cut here ]------------
>>> [    9.812469] WARNING: CPU: 0 PID: 68 at drivers/opp/core.c:630
>>> dev_pm_opp_set_rate+0x3cc/0x480
>>> [    9.821044] Modules linked in: sha256_generic sha256_arm cfg80211
>>> joydev mousedev evdev snd_soc_omap_twl4030(+) leds_gpio led_class
>>> panel_simple pwm_omap_dmtimer gpio_keys pwm_bl cpufreq_dt omap3_isp =
v
>>> ideobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
>>> bq27xxx_battery_hdq v4l2_fwnode snd_soc_omap_mcbsp bq27xxx_battery
>>> snd_soc_ti_sdma omap_wdt videodev mc omap_hdq wlcore_sdio wire cn ph
>>> y_twl4030_usb hwmon omap2430 musb_hdrc omap_mailbox twl4030_wdt
>>> watchdog udc_core rtc_twl snd_soc_twl4030 ohci_platform(+)
>>> snd_soc_core snd_pcm_dmaengine ohci_hcd snd_pcm ehci_omap(+)
>>> twl4030_pwrbutton sn
>>> d_timer twl4030_charger snd pwm_twl_led pwm_twl ehci_hcd =
industrialio
>>> soundcore twl4030_keypad matrix_keymap usbcore at24 tsc2004
>>> tsc200x_core usb_common omap_ssi hsi omapdss omapdss_base drm
>>> drm_panel_or
>>> ientation_quirks cec
>>> [    9.894470] CPU: 0 PID: 68 Comm: kworker/0:2 Not tainted
>>> 5.3.0-rc3-00785-gfdfc7f21c6b7-dirty #5
>>> [    9.903198] Hardware name: Generic OMAP36xx (Flattened Device =
Tree)
>>> [    9.909515] Workqueue: events dbs_work_handler
>>> [    9.914031] [<c01122d8>] (unwind_backtrace) from [<c010c8b8>]
>>> (show_stack+0x10/0x14)
>>> [    9.921813] [<c010c8b8>] (show_stack) from [<c089e858>]
>>> (dump_stack+0xb4/0xd4)
>>> [    9.929107] [<c089e858>] (dump_stack) from [<c0139eb0>]
>>> (__warn.part.3+0xa8/0xd4)
>>> [    9.936614] [<c0139eb0>] (__warn.part.3) from [<c013a034>]
>>> (warn_slowpath_null+0x40/0x4c)
>>> [    9.944854] [<c013a034>] (warn_slowpath_null) from [<c06d666c>]
>>> (dev_pm_opp_set_rate+0x3cc/0x480)
>>> [    9.953796] [<c06d666c>] (dev_pm_opp_set_rate) from [<bf1790ac>]
>>> (set_target+0x30/0x58 [cpufreq_dt])
>>> [    9.963012] [<bf1790ac>] (set_target [cpufreq_dt]) from
>>> [<c06db05c>] (__cpufreq_driver_target+0x188/0x514)
>>> [    9.972717] [<c06db05c>] (__cpufreq_driver_target) from
>>> [<c06de050>] (od_dbs_update+0x130/0x15c)
>>> [    9.981567] [<c06de050>] (od_dbs_update) from [<c06deb08>]
>>> (dbs_work_handler+0x28/0x58)
>>> [    9.989624] [<c06deb08>] (dbs_work_handler) from [<c0154ab0>]
>>> (process_one_work+0x20c/0x500)
>>> [    9.998107] [<c0154ab0>] (process_one_work) from [<c0155e8c>]
>>> (worker_thread+0x2c/0x5bc)
>>> [   10.006256] [<c0155e8c>] (worker_thread) from [<c015ab88>]
>>> (kthread+0x134/0x148)
>>> [   10.013702] [<c015ab88>] (kthread) from [<c01010e8>]
>>> (ret_from_fork+0x14/0x2c)
>>> [   10.020965] Exception stack(0xde63bfb0 to 0xde63bff8)
>>> [   10.026062] bfa0:                                     00000000
>>> 00000000 00000000 00000000
>>> [   10.034271] bfc0: 00000000 00000000 00000000 00000000 00000000
>>> 00000000 00000000 00000000
>>> [   10.042510] bfe0: 00000000 00000000 00000000 00000000 00000013 =
00000000
>>> [   10.049224] ---[ end trace cf0e15fa4bd57700 ]---
>>> [   10.053894] cpu cpu0: multiple regulators are not supported
>>> [   10.059509] cpufreq: __target_index: Failed to change cpu =
frequency: -22
>>=20
>> I have the same:
>>=20
>> [    4.701354] cpu cpu0: multiple regulators are not supported
>> [    4.707794] cpufreq: __target_index: Failed to change cpu =
frequency: -22
>>=20
>> Comes from within dev_pm_opp_set_rate().
>>=20
>> It appears that we also have to define opp_table->set_opp to make use
>> of _set_opp_custom(). And I am not sure which custom-opp-setter we =
should
>> use. Maybe ti_opp_supply_set_opp() is ok. Or not.
>=20
> This appears to be set by dra7.dtsi through loading the
> "ti,omap5-opp-supply" compatible driver:
>=20
> =
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/boot/dts/dra7.dt=
si#L699
>=20
> Maybe we can use "ti,omap-opp-supply" here, which does not read
> additional eFuses?
>=20
> See also
>=20
> =
https://www.kernel.org/doc/Documentation/devicetree/bindings/opp/ti-omap5-=
opp-supply.txt
>=20
> And, if I understand the code ti_opp_supply_set_opp() correctly, we =
may not have
> to rename cpu0-suppy to vdd-supply because that driver takes the first
> regulator as vdd and the second as vbb.
>=20
> Something like
>=20
> opp_supply_mpu_iva: opp_supply {
> 	compatible =3D "ti,omap-opp-supply";
> 	ti,absolute-max-voltage-uv =3D <1375000>;
> };
>=20
> But that is a quite wild guess...

Well,
seems to boot without complaints and do something reasonable!

[  144.816009] regulator regulator.3: ti_abb_get_voltage_sel
[  144.821685] regulator regulator.3: ti_abb_get_voltage_sel idx=3D2
[  144.828521] regulator regulator.3: ti_abb_set_voltage_sel: choose sel =
1
[  145.133605] regulator regulator.3: ti_abb_get_voltage_sel
[  145.139404] regulator regulator.3: ti_abb_get_voltage_sel idx=3D1
[  145.146881] regulator regulator.3: ti_abb_set_voltage_sel: choose sel =
0
[  145.174163] regulator regulator.3: ti_abb_set_voltage_sel: choose sel =
1
[  145.449493] regulator regulator.3: ti_abb_set_voltage_sel: choose sel =
0
[  145.485534] regulator regulator.3: ti_abb_set_voltage_sel: choose sel =
2

(I have added printk to ti_abb_get_voltage_sel/ti_abb_set_voltage_sel).

I can also see that there are transitions on the voltages (reg.8 is vdd =
and reg.3 is abb).

root@letux:~# cat /sys/class/regulator/regulator.8/microvolts=20
1012500
root@letux:~# cat /sys/class/regulator/regulator.8/microvolts=20
1325000
root@letux:~# cat /sys/class/regulator/regulator.8/microvolts=20
1200000
root@letux:~#

root@letux:~# cat /sys/class/regulator/regulator.3/microvolts
1325000
root@letux:~# cat /sys/class/regulator/regulator.3/microvolts
1200000
root@letux:~# cat /sys/class/regulator/regulator.3/microvolts
1200000
root@letux:~#

What I haven't checked so far is if it toggles the ABB FBB bit.

I have pushed my current work (the last 4 commits) to

=
http://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/heads=
/work-dm3730-1ghz

so that you can inspect/compare/test/check before I tidy up and add
the patches for our OPP-v2 patch set.

BR,
Nikolaus


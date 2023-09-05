Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7711792499
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjIEP7Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354910AbjIEPtB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 11:49:01 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20693194
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 08:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693928928; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kwk34fQwWUr+lYqTBJ2KdFk2MoSTGDK7A2jJTdfCEDzSbwl0OpTnP9MqjgGzRlCYo1
    JSalfymzfBtM1gYin3FSepFq5E4Q20pCxHtHC+5q7z8te+o7p6ebFPJsNRpmYm6wf5uW
    Vlnk105cAbqtf+FFnN4r8ihebHpkg7esMiMHVEhn+teqfXHX2Nl6kLqIBoco3SHN/7hK
    amsr4fd7Y2MLvd4/Der8kEM3qFxsa3fGBxQ4JwR0xU7A50cLQt3jibPAjWiHPnXpTp1F
    cPUb4YoQjzLkcp4qW4Us+BCXcSlW1ZIujeJFkIGyN1uzzD5Tno5t1bOSDLVP3nMjM/sD
    RIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693928928;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=iLHVE2rLso3/KroIMF9fiGXVeSyz4lWr1zec/HP+3k0=;
    b=ftkIQip6untAhVbINTTKPURGAeS8bXr8OPqdx5I5vQ0fio1Xd2cjrY4AAA8mpEi4xm
    /W40BqwZsNKLr1fJUd+vSKUpGJn1aGLI4quiqSvK+QY941p9U9l5YLk8eCHQ7PuYqQS+
    Jfe3lgK4ts2GPpQoG36pdHYbF885By9E0LuLyRQNkiyEOgq+QeswHqXHSL9jL5JcwEjJ
    N25PTsRPgc6SA1EI39hZmnoaTMCXKXLZa42uEBPekYIxAtJgfLhBsGIP887DLOMg6xS2
    dmM81ccyvlwLCL+G2IzcgIhairFX5R2XbEKz7X41Nsjmk28/5p15Z/RqP85sfQkwB0T0
    fyag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693928928;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=iLHVE2rLso3/KroIMF9fiGXVeSyz4lWr1zec/HP+3k0=;
    b=r/LJDL/Hoif49olnNmFpHg2IH6h8b6puZbjz1RPF87tzVoNAs2h38In355qLck4nom
    5RlPO8PWmmm12lYSX11adfr3xACFN52AH33YWd7s8zalZDTfTep5Qv0dkmGRm056kWD5
    xB6q/nmAJ4DUDIF43IZXSU1v60teq1dS33YFHYo+pHfdDK4B2UDNMyDyLDUVpCfeagSg
    Iy2Z+6b8KrKMzyifLQ0EN6Ygk4aiENeXSNDptIeM1et7CuSeWGVudkVoHjeosr+xTdzQ
    AjcilZhXEAB0/y8/NhFB3P3QSyMRvmTQqYfyy70NS7K4eDs/IleCfFbETLq9rVdavjUI
    5U2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693928928;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=iLHVE2rLso3/KroIMF9fiGXVeSyz4lWr1zec/HP+3k0=;
    b=P7kylTKkJMm3RQHZxx0J8dlDne7BE9Vrr8oLLQox8USsWTp/9XIk7MC6bJkG0ulB4G
    fAbxdLMFbnyo2vD2U2Dw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZizY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85FmlMZw
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 17:48:47 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <C6C48500-26FD-4F2C-9521-C739B57C9576@goldelico.com>
Date:   Tue, 5 Sep 2023 17:48:47 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Patrik_Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        =?utf-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CEFFAFC4-A965-4A91-AB5E-80624BA153DC@goldelico.com>
References: <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
 <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
 <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
 <ZPH5Yr3w7ruN/io0@dalakolonin.se>
 <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
 <ZPLYG16mwiwt9G9R@dalakolonin.se>
 <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
 <20230902122635.2482b0cf@aktux> <20230904063432.GV11676@atomide.com>
 <03375B42-C86E-4B37-98C2-C1FBA7AB68B6@goldelico.com>
 <20230905061208.GW11676@atomide.com>
 <9CF135C5-85B6-47CC-985C-FE6F4B24407D@goldelico.com>
 <20230905164453.3be3f33a@aktux>
 <C6C48500-26FD-4F2C-9521-C739B57C9576@goldelico.com>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 05.09.2023 um 17:09 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi,
>=20
>> Am 05.09.2023 um 16:44 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>=20
>> On Tue, 5 Sep 2023 14:42:03 +0200
>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>=20
>>> Hi Tony,
>>>=20
>>>> Am 05.09.2023 um 08:12 schrieb Tony Lindgren <tony@atomide.com>:
>>>>=20
>>>> The key observation is that the abe_iclk references in the DTS seem =
to be nowhere referenced =20
>>>>> (which may or may not be an issue):
>>>>>=20
>>>>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap44xx-clocks.dtsi#L509
>>>>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap54xx-clocks.dtsi#L161 =20
>>>>=20
>>>> So I guess the ick is in the dts the ocp_abe_iclk@528 for omap4 and
>>>> abe_iclk@528 for omap5. Seems like the driver should request them, =
I recall
>>>> that the interconnect target module does not need the ick to access =
sysc
>>>> and revision registers. =20
>>>=20
>>> Yes, that is what I suspect but I don't know how to request them.
>>>=20
>> add ,"ick" to the clock-names line in the target-module?
>> and ,<&ocp_abe_iclk> to the target module?
>=20
> You mean
>=20
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi =
b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
> index 7ca7b369b4e59..aa140a8bb9f29 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
> @@ -482,8 +482,8 @@ target-module@f1000 {                       /* =
0x401f1000, ap 32 20.0 */
>                                        <SYSC_IDLE_NO>,
>                                        <SYSC_IDLE_SMART>;
>                        /* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm =
*/
> -                       clocks =3D <&abe_clkctrl OMAP4_AESS_CLKCTRL =
0>;
> -                       clock-names =3D "fck";
> +                       clocks =3D <&abe_clkctrl OMAP4_AESS_CLKCTRL =
0>, <&ocp_abe_iclk>;
> +                       clock-names =3D "fck", "ick";
>                        #address-cells =3D <1>;
>                        #size-cells =3D <1>;
>=20

> Well, certainly worth trying!

A quick test on PandaES shows that the ick is (or becomes) active (I =
have not yet compared to without above patch):

root@letux:~# ls -l /sys/kernel/debug/clk/ocp_abe_iclk
total 0
-r--r--r-- 1 root root 0 Jan  1  1970 clk_accuracy
-r--r--r-- 1 root root 0 Jan  1  1970 clk_duty_cycle
-r--r--r-- 1 root root 0 Jan  1  1970 clk_enable_count
-r--r--r-- 1 root root 0 Jan  1  1970 clk_flags
-r--r--r-- 1 root root 0 Jan  1  1970 clk_max_rate
-r--r--r-- 1 root root 0 Jan  1  1970 clk_min_rate
-r--r--r-- 1 root root 0 Jan  1  1970 clk_notifier_count
-r--r--r-- 1 root root 0 Jan  1  1970 clk_parent
-r--r--r-- 1 root root 0 Jan  1  1970 clk_phase
-r--r--r-- 1 root root 0 Jan  1  1970 clk_prepare_count
-r--r--r-- 1 root root 0 Jan  1  1970 clk_protect_count
-r--r--r-- 1 root root 0 Jan  1  1970 clk_rate
root@letux:~# cat /sys/kernel/debug/clk/ocp_abe_iclk/*
0
1/2
1
4294967295
0
0
abe-clkctrl:0008:24
0
1
0
49152000
root@letux:~#=20

But still:

root@letux:~# xxd /sys/kernel/debug/omap-aess/cmem | head -5
00000000: 0000 0000 0000 8000 0000 8000 0000 4000  ..............@.
00000010: 0000 0000 0000 0000 0000 0000 0010 0000  ................
00000020: 0010 0000 0010 0000 0010 0000 0010 0000  ................
00000030: 0010 0000 0010 0000 0010 1500 0010 2000  .............. .
00000040: 0000 0000 0010 0000 0010 0000 0010 0000  ................
root@letux:~# xxd /sys/kernel/debug/omap-aess/dmem | head -5
00000000: 0000 0000 0000 0000 0200 0400 0000 0000  ................
00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000020: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000030: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000040: 0000 0000 0000 0000 0000 0000 0000 0000  ................
root@letux:~# xxd /sys/kernel/debug/omap-aess/smem | head -5
00000000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000020: 0000 0000 0000 0000 037f 0400 0000 0000  ................
00000030: 0282 0400 0000 0000 03ca 0600 0000 0000  ................
00000040: 05cc 0400 0000 0000 04d1 0400 0000 0000  ................
root@letux:~# xxd /sys/kernel/debug/omap-aess/pmem | head -5
[  526.023803] 8<--- cut here ---
[  526.027526] Unhandled fault: imprecise external abort (0x1406) at =
0x004f62d4
[  526.027526] [004f62d4] *pgd=3Dbb1f8831
[  526.038726] Internal error: : 1406 [#1] PREEMPT SMP ARM
[  526.038726] Modules linked in: usb_f_ecm g_ether usb_f_rndis u_ether =
libcomposite cmac bnep wl12xx wlcore mac80211 libarc4 smsc95xx usbnet =
cfg80211 snd_soc_spdif_tx snd_soc_omap_hdmi snd_soc_dmic =
snd_soc_omap_abe_twl6040 snd_soc_omap_mcpdm snd_soc_twl6040 omapdrm cec =
omap_sham emif omap_aes_driver omap2430 ehci_omap ohci_platform ohci_hcd =
bq27xxx_battery_hdq bq27xxx_battery wlcore_sdio omap_des crypto_engine =
omap_crypto libdes omap_hdq phy_twl6030_usb twl6030_gpadc musb_hdrc =
industrialio hci_uart btbcm bluetooth clk_twl6040 gpio_twl6040 =
ecdh_generic ecc snd_soc_omap_aess snd_soc_omap_mcbsp snd_soc_ti_sdma =
display_connector leds_gpio ti_tfp410 ti_tpd12s015 drm_kms_helper fuse =
drm drm_panel_orientation_quirks configfs ip_tables x_tables ipv6 =
autofs4
[  526.107086] CPU: 0 PID: 3649 Comm: xxd Tainted: G        W          =
6.5.0-letux+ #14905
[  526.117065] Hardware name: Generic OMAP4 (Flattened Device Tree)
[  526.128936] PC is at __copy_to_user_std+0x74/0x374
[  526.128936] LR is at 0x0
[  526.128936] pc : [<c093cc44>]    lr : [<00000000>]    psr: 200c0013
[  526.143249] sp : f05a9e88  ip : 00000000  fp : f05a9e98
[  526.145202] r10: 00000000  r9 : 00000000  r8 : 00000000
[  526.150787] r7 : 004f52d0  r6 : 00000000  r5 : 00000000  r4 : =
00000000
[  526.161102] r3 : 00000000  r2 : 00000f20  r1 : f0280060  r0 : =
004f5310
[  526.167968] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  =
Segment user
[  526.169311] Control: 10c5387d  Table: 81e2c04a  DAC: 00000055
[  526.180236] Register r0 information: non-paged memory
[  526.181823] Register r1 information: 0-page vmalloc region starting =
at 0xf0280000 allocated at __devm_ioremap+0x68/0xa8
[  526.197082] Register r2 information: non-paged memory
[  526.197082] Register r3 information: NULL pointer
[  526.207061] Register r4 information: NULL pointer
[  526.208465] Register r5 information: NULL pointer
[  526.213409] Register r6 information: NULL pointer
[  526.220733] Register r7 information: non-paged memory
[  526.228607] Register r8 information: NULL pointer
[  526.233398] Register r9 information: NULL pointer
[  526.238494] Register r10 information: NULL pointer
[  526.243530] Register r11 information: 2-page vmalloc region starting =
at 0xf05a8000 allocated at kernel_clone+0xc0/0x2e8
[  526.247070] Register r12 information: NULL pointer
[  526.257080] Process xxd (pid: 3649, stack limit =3D 0xccd1bf74)
[  526.257080] Stack: (0xf05a9e88 to 0xf05aa000)
[  526.270568] 9e80:                   f05a9f70 c17c1040 f0280000 =
00000051 004f52d0 00001000
[  526.270568] 9ea0: 00000000 00001000 004f5190 bf15b6b4 c471e540 =
bf15b768 c276c660 004f52d0
[  526.283569] 9ec0: 00001000 f05a9f70 00000003 bf15b784 f0280000 =
00002000 00001000 c03bf80c
[  526.290069] 9ee0: c03bf7c4 00001000 c471e540 f05a9f70 c0e03fc8 =
004f52d0 00000003 c028ab88
[  526.297058] 9f00: c1e2c010 00000000 00000000 00000000 ffefe3d8 =
efd5cf14 00000000 e519f734
[  526.313568] 9f20: 00516000 00000817 f05a9fb0 004f62d4 00000817 =
c1a25e00 00000255 004f6000
[  526.322174] 9f40: 00000000 c09718f8 0a891c34 e519f734 63a445cf =
c471e540 f05a9f70 004f52d0
[  526.330780] 9f60: c0e03fc8 f05a9f7c 00001000 c028afe0 00000000 =
00000000 00000009 c471e540
[  526.338226] 9f80: 00000000 e519f734 00000000 004f5190 000005e8 =
b6fcfbf0 00000003 c01002e8
[  526.339385] 9fa0: c17d5780 c0100080 004f5190 000005e8 00000003 =
004f52d0 00001000 00000000
[  526.354766] 9fc0: 004f5190 000005e8 b6fcfbf0 00000003 00000002 =
00000009 00000000 004f5190
[  526.365173] 9fe0: 00000003 bea8fb60 b6f43d17 b6eca7e6 400c0030 =
00000003 00000000 00000000
[  526.373779]  __copy_to_user_std from aess_read_mem+0xf0/0x138 =
[snd_soc_omap_aess]
[  526.381744]  aess_read_mem [snd_soc_omap_aess] from =
aess_read_pmem+0x1c/0x24 [snd_soc_omap_aess]
[  526.391052]  aess_read_pmem [snd_soc_omap_aess] from =
full_proxy_read+0x48/0x5c
[  526.392395]  full_proxy_read from vfs_read+0x140/0x180
[  526.401733]  vfs_read from ksys_read+0x68/0xb4
[  526.408813]  ksys_read from ret_fast_syscall+0x0/0x54
[  526.410064] Exception stack(0xf05a9fa8 to 0xf05a9ff0)
[  526.419464] 9fa0:                   004f5190 000005e8 00000003 =
004f52d0 00001000 00000000
[  526.424072] 9fc0: 004f5190 000005e8 b6fcfbf0 00000003 00000002 =
00000009 00000000 004f5190
[  526.433044] 9fe0: 00000003 bea8fb60 b6f43d17 b6eca7e6
[  526.437072] Code: f5d1f05c f5d1f07c e8b15378 e2522020 (e8a05378)=20
[  526.437072] ---[ end trace 0000000000000000 ]---
[  526.437072] note: xxd[3649] exited with irqs disabled
[  526.458831] 8<--- cut here ---
[  526.462066] Unhandled fault: imprecise external abort (0x1406) at =
0x004f62d4
[  526.467987] [004f62d4] *pgd=3D00000000
root@letux:~#=20

BR,
Nikolaus


Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1773B852B
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 16:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234882AbhF3Opt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 10:45:49 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:35876 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbhF3Opt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Jun 2021 10:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625064196;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=RZTO0eUtL1ttsyDT07q/xIMk5tcfXV2eWGp5vgDtyWk=;
    b=LdDpeC7FhaKNPrS43epmdGI9lvMCozN6x7/tqp8c8hJq7znMkGbqDaEl61dcdydaoJ
    jWgjCBRe2GLrBfetum9kW2M2xeNuR5Wg50lVDXNWeS/qTamiwWN5q1Z3p8ll4whnuoNr
    I8LRx5Wvg/OugkkYvhYnF+KZl9mZxru38QMNDswRGimitmD5peN8fLU/argkuEPRmnUK
    5m6LEy7oQf55WPI+DeVFMi59Ge+iGPFPLr3U9gmgS0aKWXqf5wqvfmRgsgkVZJNDkEo5
    7hFp1kzwN0KrDabbzugac6KWX5fJBvLFFHttRFNwwAaRx+95LiYSV9BNUjD+KXa75oRJ
    /c/w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWfXA0NbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x5UEhF1C8
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 30 Jun 2021 16:43:15 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210630130425.GF5106@sirena.org.uk>
Date:   Wed, 30 Jun 2021 16:43:14 +0200
Cc:     Graeme Gregory <gg@slimlogic.co.uk>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E57CB314-F56C-4B33-81E8-7927564DB751@goldelico.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
 <20210629185638.GG4613@sirena.org.uk>
 <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
 <20210630121307.GA5106@sirena.org.uk>
 <02EE05C2-588F-4D50-8A37-46CC3B0C302C@goldelico.com>
 <20210630130425.GF5106@sirena.org.uk>
To:     Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mark,

> Am 30.06.2021 um 15:04 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Wed, Jun 30, 2021 at 02:29:02PM +0200, H. Nikolaus Schaller wrote:
>>> Am 30.06.2021 um 14:13 schrieb Mark Brown <broonie@kernel.org>:
>=20
>> I think it could be indirectly circular since ldo3_reg does not find =
smps3
>> registered. But I have to run more tests with printk inserted.
>=20
> Why would LDO3 have a dependency on SPMS3 given what's written above =
and
> how would that be circular?

because both can only probe successfully in common or not at all. If =
either
fails the other is rewound.

>=20
>>> The driver should just register all the DCDCs before the LDOs, then
>>> everything will sort itself out.
>=20
>> Basically the driver code does it that way. But fails. Probing seems =
to defer
>> until deferral limits (AFAIR there is a timer or counter in the probe =
deferral
>> queue) an does not succeed.
>=20
> Ah, I see - the issue is the intervening 1.8V regulator.  That's not a
> circularity, that's the callout to a separate device in the middle of
> the chain.

Ok, "circular" is maybe the wrong word. It is an unexpected =
dependency...

>  It's a super weird hardware design if the DT is accurate,

I get the impression that the vdds_1v8_main is in the DT =
(omap5-board-common.dtsi)
only as an alias for smps7. Maybe to get more flexibility in overwriting
in board files? I.e. replace the power controller without having a fixed
definition of smps7 elsewhere.

Or to separate DT node names defined by the power controller (smps1-5)
from their useage on the board (vmain, vsys, vdds_1v8, vmmcsd, ...).

And, vdds_1v8_main is the only fixed-regulator used as a wrapper.
Others have either no vin-supply or are real regulators with a control =
gpio.

Looking into the schematics of the OMAP5432EVM or the Pyra handheld does
not reveal a physical regulator. It is just that the output signal of
smps7 is called "VDDS_1v8_MAIN".

Therefore, a completely different approach could be to remove =
fixedregulator-vdds_1v8_main
and replace by smps7_reg.

I tried with

	#define vdds_1v8_main smps7_reg

and it compiles and boots successfully.

There are still messages from the new rule for supply_name && !supply, =
but this time
Palmas gets initialized (maybe the -EPROBE_DEFER is silently ignored =
somewhere).

But is changing the DT the right solution if the Palmas and Fixed =
regulator
drivers can't handle the untouched DT which is logically correct (not =
physically)?

> it's hard to see how it's not going to be hurting efficiency.

Well, I think the regulators are enabled only once during boot so nobody
notices an issue.

>  In any
> case simplest thing would be to have separate MFD subdevices in Palmas
> for the LDOs and DCDCs, that'll do the right thing.

Attached is some logging an additional rdev_info() if the new rule
in set_machine_constraints() if it triggers and returns -EPROBE_DEFER.

We can see that several regulators trigger on the condition but indeed
ldo3 fails (which I so far only deduced from DT as the potential =
disturbance).

So we know several ways to get the hardware running again:
* revert 98e48cd9283d
* my hack to set supply_name later (makes the new rule ignored but may =
have side-effects)
* modify DTS to make vdds_1v8_main =3D=3D smps7_reg
* (untested) make SMPS and LDOs separate subdevices in Palmas drivers

@Tony, your comments are needed...

Maybe you didn't notice since you may have configured Palmas into the =
kernel
which changes probe sequence.

BR and thanks,
Nikolaus

[    2.017857] palmas-rtc 48070000.i2c:palmas@48:rtc: registered as rtc0
[    2.026122] palmas-rtc 48070000.i2c:palmas@48:rtc: setting system =
clock to 2000-01-01T00:00:00 UTC (946684800)
[    2.041192] smps123: supply_name: smps1-in supply: 00000000
[    2.047112] smps123: supplied by regulator-dummy
[    2.054376] smps45: supply_name: smps4-in supply: 00000000
[    2.060240] smps45: supplied by regulator-dummy
[    2.067193] smps6: supply_name: smps6-in supply: 00000000
[    2.072909] smps6: supplied by vsys_cobra
[    2.079644] smps7: supply_name: smps7-in supply: 00000000
[    2.085346] smps7: supplied by vsys_cobra
[    2.092034] smps8: supply_name: smps8-in supply: 00000000
[    2.097735] smps8: supplied by vsys_cobra
[    2.105096] smps9: Bringing 0uV into 2100000-2100000uV
[    2.113152] smps9: supplied by vsys_cobra
[    2.118035] smps10_out2: supply_name: smps10-in supply: 00000000
[    2.124429] smps10_out2: supplied by regulator-dummy
[    2.133172] smps10_out1: supplied by regulator-dummy
[    2.138787] ldo1: Bringing 0uV into 1800000-1800000uV
[    2.145928] ldo1: supplied by vsys_cobra
[    2.150994] ldo2: supplied by vsys_cobra
[    2.155633] ldo3: supply_name: ldo3-in supply: 00000000
[    2.161436] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed to =
register 48070000.i2c:palmas@48:palmas_pmic regulator
[    2.178796] omap_hsmmc 480ad000.mmc: allocated mmc-pwrseq
[    2.186431] mmc_pwrseq_simple_set_gpios_value: value=3D1
[    2.187507] smps123: supply_name: smps1-in supply: 00000000
[    2.197895] smps123: supplied by regulator-dummy
[    2.204583] smps45: supply_name: smps4-in supply: 00000000
[    2.210473] smps45: supplied by regulator-dummy
[    2.217019] smps6: supply_name: smps6-in supply: 00000000
[    2.223173] smps6: supplied by vsys_cobra
[    2.228906] smps7: supply_name: smps7-in supply: 00000000
[    2.234673] smps7: supplied by vsys_cobra
[    2.240930] smps8: supply_name: smps8-in supply: 00000000
[    2.246631] smps8: supplied by vsys_cobra
[    2.252745] smps9: Bringing 0uV into 2100000-2100000uV
[    2.259318] smps9: supplied by vsys_cobra
[    2.264469] smps10_out2: supply_name: smps10-in supply: 00000000
[    2.270932] smps10_out2: supplied by regulator-dummy
[    2.278222] smps10_out1: supplied by regulator-dummy
[    2.284324] ldo1: supplied by vsys_cobra
[    2.289422] ldo2: supplied by vsys_cobra
[    2.294270] ldo3: supply_name: ldo3-in supply: 00000000
[    2.299859] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed to =
register 48070000.i2c:palmas@48:palmas_pmic regulator
[    2.299905] mmc_pwrseq_simple_set_gpios_value: value=3D0
[    2.318572] input: user-buttons as =
/devices/platform/user-buttons/input/input0
[    2.329003] smps123: supply_name: smps1-in supply: 00000000
[    2.334916] input: pyra-game-buttons as =
/devices/platform/pyra-game-buttons/input/input1
[    2.336655] input: pyra-lid-wakeup as =
/devices/platform/pyra-lid-wakeup/input/input2
[    2.352845] smps123: supplied by regulator-dummy
[    2.359670] l3main2_cm:clk:0010:0: failed to disable
[    2.370659] l4sec_cm:clk:0038:0: failed to disable
[    2.376292] ALSA device list:
[    2.376739] smps45: supply_name: smps4-in supply: 00000000
[    2.379521]   No soundcards found.
[    2.389296] smps45: supplied by regulator-dummy
[    2.396203] smps6: supply_name: smps6-in supply: 00000000
[    2.401981] smps6: supplied by vsys_cobra
[    2.406732] omap_hsmmc 480ad000.mmc: card claims to support voltages =
below defined range
[    2.416790] smps7: supply_name: smps7-in supply: 00000000
[    2.422604] smps7: supplied by vsys_cobra
[    2.428674] smps8: supply_name: smps8-in supply: 00000000
[    2.434472] smps8: supplied by vsys_cobra
[    2.440728] smps9: Bringing 0uV into 2100000-2100000uV
[    2.447350] smps9: supplied by vsys_cobra
[    2.452508] smps10_out2: supply_name: smps10-in supply: 00000000
[    2.458917] smps10_out2: supplied by regulator-dummy
[    2.467645] mmc2: new high speed SDIO card at address 0001
[    2.474295] mmc_pwrseq_simple_set_gpios_value: value=3D1
[    2.480100] smps10_out1: supplied by regulator-dummy
[    2.486272] ldo1: supplied by vsys_cobra
[    2.492500] ldo2: supplied by vsys_cobra
[    2.497155] ldo3: supply_name: ldo3-in supply: 00000000
[    2.502709] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed to =
register 48070000.i2c:palmas@48:palmas_pmic regulator
[    2.522668] smps123: supply_name: smps1-in supply: 00000000
[    2.528588] smps123: supplied by regulator-dummy
[    2.535669] smps45: supply_name: smps4-in supply: 00000000
[    2.541711] smps45: supplied by regulator-dummy
[    2.548638] smps6: supply_name: smps6-in supply: 00000000
[    2.554498] smps6: supplied by vsys_cobra
[    2.560245] smps7: supply_name: smps7-in supply: 00000000
[    2.565968] smps7: supplied by vsys_cobra
[    2.572198] smps8: supply_name: smps8-in supply: 00000000
[    2.577897] smps8: supplied by vsys_cobra
[    2.584466] smps9: Bringing 0uV into 2100000-2100000uV
[    2.591631] smps9: supplied by vsys_cobra
[    2.596520] smps10_out2: supply_name: smps10-in supply: 00000000
[    2.603112] smps10_out2: supplied by regulator-dummy
[    2.610365] smps10_out1: supplied by regulator-dummy
[    2.616175] ldo1: supplied by vsys_cobra
[    2.621193] ldo2: supplied by vsys_cobra
[    2.625845] ldo3: supply_name: ldo3-in supply: 00000000
[    2.631402] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed to =
register 48070000.i2c:palmas@48:palmas_pmic regulator
[    2.646447] Waiting for root device PARTUUID=3D7c769003-02..


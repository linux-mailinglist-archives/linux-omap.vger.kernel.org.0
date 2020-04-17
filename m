Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E421ADFB5
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 16:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgDQOYF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 10:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgDQOYE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Apr 2020 10:24:04 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EDEC061A0C;
        Fri, 17 Apr 2020 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587133442;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=jO+yQRzrrw68/h3Wl6XnCozXZ5ZYigOcbMraY2Wt/Go=;
        b=nPBtDwzDg+x5S+A4ijT0C/Xei3e/cPD6xhniPZFqiSN/bXw54jOSolcj6QBoumY4OY
        Tb7ENyGy5AZo9SEpgglhluFRb2oP/1gt5MB6iNJCinFlgg7bsrWmAKQCGYmRO65cPw+M
        cNSX0lKls7Ct6NSeclQujoY4Z6BYELPwbWto+eIy5xxaSDE0s5nEpZZETQs4Ng8c0tab
        HH2v1HSwE9y36EGAycUt/QzZygQFbHKfiMnDteL6cGTlDTGYLaang4Qf8A3NmXUx9cch
        kknGQ1vpZs4sTSVVS8pTbF0ATJjcpDNRtCYxB3EhlOJ8LjwFKYDJFjAihm9a/txHc8rA
        Y8fQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3HEMm2A5
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 17 Apr 2020 16:22:48 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200416184638.GI37466@atomide.com>
Date:   Fri, 17 Apr 2020 16:22:47 +0200
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com> <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com> <20200416184638.GI37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 16.04.2020 um 20:46 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [200416 15:04]:
>> Hi Tony,
>> it looks as if something with this patch is broken on GTA04. For v5.6 =
and v5.7-rc1.
>>=20
>> HDQ battery access times out after ca. 15 seconds and I get =
temperature of -273.1=C2=B0C...
>>=20
>> Reverting this patch and everything is ok again.
>=20
> Hmm OK interesting.
>=20
>> What is "ti,mode" about? Do we have that (indirectly) in gta04.dtsi?
>> Or does this patch need some CONFIGs we do not happen to have?
>=20
> Sounds like you have things working though so there should be no
> need for having ti,mode =3D "1w" in the dts.
>=20
>>> 	pm_runtime_enable(&pdev->dev);
>>> +	pm_runtime_use_autosuspend(&pdev->dev);
>>> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
>=20
> Care to check if changing pm_runtime_set_autosuspend_delay value
> to -1 in probe makes the issue go away? Or change it manually
> to -1 via sysfs.
>=20
> If that helps, likely we have a missing pm_runtime_get_sync()
> somewhere in the driver.

Yes, it does! It suffices to set it to -1 for one readout.
Aything else I can test?

root@letux:~# time cat /sys/class/power_supply/bq27000-battery/uevent
POWER_SUPPLY_NAME=3Dbq27000-battery
POWER_SUPPLY_STATUS=3DDischarging
POWER_SUPPLY_PRESENT=3D1
POWER_SUPPLY_VOLTAGE_NOW=3D4049000
POWER_SUPPLY_CURRENT_NOW=3D233478
POWER_SUPPLY_CAPACITY=3D0
POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
POWER_SUPPLY_TEMP=3D-2731
POWER_SUPPLY_TIME_TO_EMPTY_NOW=3D0
POWER_SUPPLY_TIME_TO_EMPTY_AVG=3D0
POWER_SUPPLY_TIME_TO_FULL_NOW=3D0
POWER_SUPPLY_TECHNOLOGY=3DLi-ion
POWER_SUPPLY_CHARGE_FULL=3D0
POWER_SUPPLY_CHARGE_NOW=3D755788
POWER_SUPPLY_CHARGE_FULL_DESIGN=3D1233792
POWER_SUPPLY_CYCLE_COUNT=3D80
POWER_SUPPLY_ENERGY_NOW=3D0
POWER_SUPPLY_POWER_AVG=3D941700
POWER_SUPPLY_HEALTH=3DGood
POWER_SUPPLY_MANUFACTURER=3DTexas Instruments

real    0m8.910s
user    0m0.001s
sys     0m0.028s
root@letux:~# echo -1 =
>/sys/bus/platform/drivers/omap_hdq/480b2000.1w/power/autosuspend_delay_ms=

root@letux:~# time cat /sys/class/power_supply/bq27000-battery/uevent
POWER_SUPPLY_NAME=3Dbq27000-battery
POWER_SUPPLY_STATUS=3DDischarging
POWER_SUPPLY_PRESENT=3D1
POWER_SUPPLY_VOLTAGE_NOW=3D3985000
POWER_SUPPLY_CURRENT_NOW=3D231871
POWER_SUPPLY_CAPACITY=3D78
POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
POWER_SUPPLY_TEMP=3D354
POWER_SUPPLY_TIME_TO_EMPTY_NOW=3D10440
POWER_SUPPLY_TIME_TO_EMPTY_AVG=3D9900
POWER_SUPPLY_TECHNOLOGY=3DLi-ion
POWER_SUPPLY_CHARGE_FULL=3D858138
POWER_SUPPLY_CHARGE_NOW=3D670170
POWER_SUPPLY_CHARGE_FULL_DESIGN=3D1233792
POWER_SUPPLY_CYCLE_COUNT=3D80
POWER_SUPPLY_ENERGY_NOW=3D2544780
POWER_SUPPLY_POWER_AVG=3D922720
POWER_SUPPLY_HEALTH=3DGood
POWER_SUPPLY_MANUFACTURER=3DTexas Instruments

real    0m0.232s
user    0m0.001s
sys     0m0.023s
root@letux:~# echo 300 =
>/sys/bus/platform/drivers/omap_hdq/480b2000.1w/power/autosuspend_delay_ms=

root@letux:~# time cat /sys/class/power_supply/bq27000-battery/uevent
POWER_SUPPLY_NAME=3Dbq27000-battery
POWER_SUPPLY_STATUS=3DDischarging
POWER_SUPPLY_PRESENT=3D1
POWER_SUPPLY_VOLTAGE_NOW=3D3985000
POWER_SUPPLY_CURRENT_NOW=3D234727
POWER_SUPPLY_CAPACITY=3D78
POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
POWER_SUPPLY_TEMP=3D354
POWER_SUPPLY_TIME_TO_EMPTY_NOW=3D10620
POWER_SUPPLY_TIME_TO_EMPTY_AVG=3D10140
POWER_SUPPLY_TECHNOLOGY=3DLi-ion
POWER_SUPPLY_CHARGE_FULL=3D858138
POWER_SUPPLY_CHARGE_NOW=3D669102
POWER_SUPPLY_CHARGE_FULL_DESIGN=3D1233792
POWER_SUPPLY_CYCLE_COUNT=3D80
POWER_SUPPLY_ENERGY_NOW=3D2541860
POWER_SUPPLY_POWER_AVG=3D903740
POWER_SUPPLY_HEALTH=3DGood
POWER_SUPPLY_MANUFACTURER=3DTexas Instruments

real    0m0.178s
user    0m0.000s
sys     0m0.029s
root@letux:~#=20

BR and thanks,
Nikolaus


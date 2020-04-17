Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CB01AE71A
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 23:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgDQVEF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 17:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgDQVEE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Apr 2020 17:04:04 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C33C061A0C;
        Fri, 17 Apr 2020 14:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587157441;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=j1rZtNYCOuJ71ejCqEXPl4BLBezVcKcNenOU4xma8mA=;
        b=Um70ukBeyFFmTHByFTZt5NNNpXTktXkR2StjA2XWIIAF4xVXm98YI/Kb7gxq+EXaVE
        o3eU/R/IUcjo9HBOVhvyQ+lq0T8EU8Gykr6MoOSlCgWbnwHm2dJak2keZwHFyRruKbJd
        WgXtNPQw+MMm17zg1/BROf/pLPEAD3C4wxzBUBaNdsw0V3qQp5ig4Tjz9GnrUVv74Qgk
        4P7nG4F+edmzGo8pAPDtKk991m5M/MDw9vnEKU/icAQX2nQVS9ESsAUWfRAQh7dCx/1+
        v5MalUYG2FfDqTgFPJSce7moKNIoBXp82yCQ5uPi453FwyQD5M0vUiKg+wIzmfIS2YMb
        K+VA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3HL3n589
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 17 Apr 2020 23:03:49 +0200 (CEST)
Subject: Re: [PATCHv3] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200417150721.GL37466@atomide.com>
Date:   Fri, 17 Apr 2020 23:03:48 +0200
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8E062482-5D5D-4837-9980-D6C708DD24D4@goldelico.com>
References: <20191217004048.46298-1-tony@atomide.com> <7B8C7DD9-095B-48FC-9642-695D07B79E97@goldelico.com> <20200416184638.GI37466@atomide.com> <3197C3F0-DEB9-4221-AFBD-4F2A08C84C4C@goldelico.com> <20200417164340.3d9043d1@aktux> <6430AF54-849E-456B-8DB0-B4478BBDB78D@goldelico.com> <20200417150721.GL37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 17.04.2020 um 17:07 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [200417 14:53]:
>>=20
>>> Am 17.04.2020 um 16:43 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>>=20
>>> On Fri, 17 Apr 2020 16:22:47 +0200
>>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>>=20
>>>>> Am 16.04.2020 um 20:46 schrieb Tony Lindgren <tony@atomide.com>:
>>>>> Care to check if changing pm_runtime_set_autosuspend_delay value
>>>>> to -1 in probe makes the issue go away? Or change it manually
>>>>> to -1 via sysfs.
>>>>>=20
>>>>> If that helps, likely we have a missing pm_runtime_get_sync()
>>>>> somewhere in the driver. =20
>>>>=20
>>>> Yes, it does! It suffices to set it to -1 for one readout.
>>>> Aything else I can test?
>=20
> You could sprinkle dev_info(dev, "%s\n", __func__) to the
> omap_hdq_runtime_suspend() and omap_hdq_runtime_resume()
> functions.

I have done it incl. adding dev_info to hdq_read_byte(). It
looks as if the read attempts already time out during boot,
but after omap_hdq_runtime_resume(). And omap_hdq_runtime_resume()
is done well after the last one. This looks ok.

echo -1 >autosuspend_delay_ms

Does omap_hdq_runtime_resume() once.

To me it looks as if reading hqd too quickly after =
omap_hdq_runtime_resume()
may be part of the problem, although it is 0.4 seconds between [   =
18.355163]
and [   18.745269]. So I am not sure about my interpretation.

A different attempt for interpretation may be that trying to read the
slave triggers omap_hdq_runtime_resume() just before doing the
first hdq_read_byte().

This may be different context from separating these steps into different
processes/threads (echo + cat).

I.e.

[   18.355163] omap_hdq 480b2000.1w: omap_hdq_runtime_resume
[   18.432403] omap_hdq 480b2000.1w: OMAP HDQ Hardware Rev 0.5. Driver =
in Interrupt mode
[   18.745269] omap_hdq 480b2000.1w: hdq_read_byte

somehow differs from

root@letux:~# echo -1 =
>/sys/bus/platform/drivers/omap_hdq/480b2000.1w/power/autosuspend_delay_ms=

[  544.714904] omap_hdq 480b2000.1w: omap_hdq_runtime_resume
root@letux:~# time cat /sys/class/power_supply/bq27000-battery/uevent
[  551.704498] omap_hdq 480b2000.1w: hdq_read_byte

BR,
Nikolaus


root@letux:~# dmesg|fgrep hdq
[   18.355163] omap_hdq 480b2000.1w: omap_hdq_runtime_resume
[   18.432403] omap_hdq 480b2000.1w: OMAP HDQ Hardware Rev 0.5. Driver =
in Interrupt mode
[   18.745269] omap_hdq 480b2000.1w: hdq_read_byte
[   19.163055] omap_hdq 480b2000.1w: hdq_read_byte
[   19.583099] omap_hdq 480b2000.1w: hdq_read_byte
[   20.003051] omap_hdq 480b2000.1w: hdq_read_byte
[   20.422973] omap_hdq 480b2000.1w: hdq_read_byte
[   20.843109] omap_hdq 480b2000.1w: hdq_read_byte
[   21.262908] omap_hdq 480b2000.1w: hdq_read_byte
[   21.682922] omap_hdq 480b2000.1w: hdq_read_byte
[   22.103149] omap_hdq 480b2000.1w: hdq_read_byte
[   22.523040] omap_hdq 480b2000.1w: hdq_read_byte
[   22.963012] omap_hdq 480b2000.1w: hdq_read_byte
[   23.390197] omap_hdq 480b2000.1w: hdq_read_byte
[   23.812988] omap_hdq 480b2000.1w: hdq_read_byte
[   24.232971] omap_hdq 480b2000.1w: hdq_read_byte
[   24.653167] omap_hdq 480b2000.1w: hdq_read_byte
[   25.073028] omap_hdq 480b2000.1w: hdq_read_byte
[   25.493011] omap_hdq 480b2000.1w: hdq_read_byte
[   25.923095] omap_hdq 480b2000.1w: hdq_read_byte
[   26.133392] omap_hdq 480b2000.1w: hdq_read_byte
[   26.553009] omap_hdq 480b2000.1w: hdq_read_byte
[   26.973083] omap_hdq 480b2000.1w: hdq_read_byte
[   27.393035] omap_hdq 480b2000.1w: hdq_read_byte
[   27.813354] omap_hdq 480b2000.1w: hdq_read_byte
[   28.233367] omap_hdq 480b2000.1w: hdq_read_byte
[   28.673309] omap_hdq 480b2000.1w: hdq_read_byte
[   29.093322] omap_hdq 480b2000.1w: hdq_read_byte
[   29.513366] omap_hdq 480b2000.1w: hdq_read_byte
[   29.948089] omap_hdq 480b2000.1w: hdq_read_byte
[   30.403076] omap_hdq 480b2000.1w: hdq_read_byte
[   30.823303] omap_hdq 480b2000.1w: hdq_read_byte
[   31.243408] omap_hdq 480b2000.1w: hdq_read_byte
[   31.663085] omap_hdq 480b2000.1w: hdq_read_byte
[   32.083312] omap_hdq 480b2000.1w: hdq_read_byte
[   32.503326] omap_hdq 480b2000.1w: hdq_read_byte
[   32.923309] omap_hdq 480b2000.1w: hdq_read_byte
[   33.343353] omap_hdq 480b2000.1w: hdq_read_byte
[   33.763305] omap_hdq 480b2000.1w: hdq_read_byte
[   33.814392] Modules linked in: wl18xx wlcore mac80211 cfg80211 =
libarc4 omapdrm cmac bnep panel_tpo_td028ttec1 pps_gpio =
snd_soc_simple_card snd_soc_simple_card_utils pps_core simple_bridge =
wwan_on_off snd_soc_omap_twl4030 snd_soc_w2cbw003_bt snd_soc_gtm601 =
display_connector generic_adc_battery pwm_bl pwm_omap_dmtimer =
omap_aes_driver crypto_engine omap_crypto wlcore_sdio omap3_isp =
videobuf2_dma_contig omap_sham videobuf2_memops videobuf2_v4l2 =
bq27xxx_battery_hdq bq27xxx_battery videobuf2_common omap2430 omap_hdq =
bmp280_spi snd_soc_omap_mcbsp snd_soc_ti_sdma ov9655 bmp280_i2c =
v4l2_fwnode bmp280 bmg160_i2c bmg160_core at24 tsc2007 videodev =
leds_tca6507 mc bno055 bmc150_magn_i2c bmc150_accel_i2c bmc150_magn =
bmc150_accel_core industrialio_triggered_buffer snd_soc_si47xx kfifo_buf =
phy_twl4030_usb musb_hdrc twl4030_pwrbutton twl4030_vibra =
snd_soc_twl4030 hci_uart btbcm twl4030_charger twl4030_madc industrialio =
input_polldev gnss_sirf bluetooth gnss ecdh_generic ecc ehci_omap =
omapdss omapdss_base
[   34.363281] omap_hdq 480b2000.1w: hdq_read_byte
[   34.783142] omap_hdq 480b2000.1w: hdq_read_byte
[   35.203124] omap_hdq 480b2000.1w: hdq_read_byte
[   35.623382] omap_hdq 480b2000.1w: hdq_read_byte
[   36.043273] omap_hdq 480b2000.1w: hdq_read_byte
[   36.463317] omap_hdq 480b2000.1w: hdq_read_byte
[   36.883392] omap_hdq 480b2000.1w: hdq_read_byte
[   37.303314] omap_hdq 480b2000.1w: hdq_read_byte
[   37.723327] omap_hdq 480b2000.1w: hdq_read_byte
[   38.143341] omap_hdq 480b2000.1w: hdq_read_byte
[   38.563323] omap_hdq 480b2000.1w: hdq_read_byte
[   38.983306] omap_hdq 480b2000.1w: hdq_read_byte
[   39.403350] omap_hdq 480b2000.1w: hdq_read_byte
[   39.823303] omap_hdq 480b2000.1w: hdq_read_byte
[   40.243347] omap_hdq 480b2000.1w: hdq_read_byte
[   40.663299] omap_hdq 480b2000.1w: hdq_read_byte
[   41.083374] omap_hdq 480b2000.1w: hdq_read_byte
[   41.503295] omap_hdq 480b2000.1w: hdq_read_byte
[   41.923400] omap_hdq 480b2000.1w: hdq_read_byte
[   42.343292] omap_hdq 480b2000.1w: hdq_read_byte
[   42.763305] omap_hdq 480b2000.1w: hdq_read_byte
[   43.183319] omap_hdq 480b2000.1w: hdq_read_byte
[   43.603332] omap_hdq 480b2000.1w: hdq_read_byte
[   44.188964] omap_hdq 480b2000.1w: omap_hdq_runtime_suspend
root@letux:~# time cat /sys/class/power_supply/bq27000-battery/uevent
[  383.654083] omap_hdq 480b2000.1w: omap_hdq_runtime_resume
[  383.868103] omap_hdq 480b2000.1w: hdq_read_byte
[  384.288055] omap_hdq 480b2000.1w: hdq_read_byte
[  384.708129] omap_hdq 480b2000.1w: hdq_read_byte
[  385.128173] omap_hdq 480b2000.1w: hdq_read_byte
[  385.548156] omap_hdq 480b2000.1w: hdq_read_byte
[  385.968139] omap_hdq 480b2000.1w: hdq_read_byte
[  385.973052] omap_hdq 480b2000.1w: hdq_read_byte
[  386.200683] omap_hdq 480b2000.1w: hdq_read_byte
[  386.215606] omap_hdq 480b2000.1w: hdq_read_byte
[  386.223358] omap_hdq 480b2000.1w: hdq_read_byte
[  386.241729] omap_hdq 480b2000.1w: hdq_read_byte
[  386.251129] omap_hdq 480b2000.1w: hdq_read_byte
[  386.260986] omap_hdq 480b2000.1w: hdq_read_byte
[  386.272460] omap_hdq 480b2000.1w: hdq_read_byte
[  386.281402] omap_hdq 480b2000.1w: hdq_read_byte
[  386.286865] omap_hdq 480b2000.1w: hdq_read_byte
[  386.510711] omap_hdq 480b2000.1w: hdq_read_byte
[  386.526153] omap_hdq 480b2000.1w: hdq_read_byte
[  386.533905] omap_hdq 480b2000.1w: hdq_read_byte
[  386.551818] omap_hdq 480b2000.1w: hdq_read_byte
[  386.561065] omap_hdq 480b2000.1w: hdq_read_byte
[  386.570922] omap_hdq 480b2000.1w: hdq_read_byte
[  386.582641] omap_hdq 480b2000.1w: hdq_read_byte
[  386.591339] omap_hdq 480b2000.1w: hdq_read_byte
[  386.602508] omap_hdq 480b2000.1w: hdq_read_byte
[  386.610900] omap_hdq 480b2000.1w: hdq_read_byte
[  386.620941] omap_hdq 480b2000.1w: hdq_read_byte
[  386.632476] omap_hdq 480b2000.1w: hdq_read_byte
[  386.641387] omap_hdq 480b2000.1w: hdq_read_byte
[  386.652709] omap_hdq 480b2000.1w: hdq_read_byte
[  386.660949] omap_hdq 480b2000.1w: hdq_read_byte
[  386.671051] omap_hdq 480b2000.1w: hdq_read_byte
[  386.680908] omap_hdq 480b2000.1w: hdq_read_byte
[  386.691986] omap_hdq 480b2000.1w: hdq_read_byte
[  386.701324] omap_hdq 480b2000.1w: hdq_read_byte
[  386.709045] omap_hdq 480b2000.1w: hdq_read_byte
[  386.720886] omap_hdq 480b2000.1w: hdq_read_byte
[  386.731872] omap_hdq 480b2000.1w: hdq_read_byte
[  386.741424] omap_hdq 480b2000.1w: hdq_read_byte
[  386.749053] omap_hdq 480b2000.1w: hdq_read_byte
[  386.761413] omap_hdq 480b2000.1w: hdq_read_byte
[  386.768798] omap_hdq 480b2000.1w: hdq_read_byte
[  386.780853] omap_hdq 480b2000.1w: hdq_read_byte
[  386.791839] omap_hdq 480b2000.1w: hdq_read_byte
[  386.801635] omap_hdq 480b2000.1w: hdq_read_byte
[  386.808746] omap_hdq 480b2000.1w: hdq_read_byte
[  386.820831] omap_hdq 480b2000.1w: hdq_read_byte
[  386.828124] omap_hdq 480b2000.1w: hdq_read_byte
[  386.840362] omap_hdq 480b2000.1w: hdq_read_byte
[  386.847534] omap_hdq 480b2000.1w: hdq_read_byte
[  386.859680] omap_hdq 480b2000.1w: hdq_read_byte
[  386.866882] omap_hdq 480b2000.1w: hdq_read_byte
[  386.882263] omap_hdq 480b2000.1w: hdq_read_byte
POWER_SUPPLY_NAME=3Dbq27000-battery
POWER_SUPPLY_STATUS=3DDischarging
POWER_SUPPLY_PRE[  386.897064] omap_hdq 480b2000.1w: hdq_read_byte
SENT=3D1
POWER_SUPPLY_VOLTAGE_NOW=3D4017000
POWER_SUPPLY_CURRENT_NOW=3D226873
POWER_SUPPLY_CAPACITY=3D83
POWER_SUPPL[  386.911407] omap_hdq 480b2000.1w: hdq_read_byte
Y_CAPACITY_LEVEL=3DNormal
POWER_SUPPLY_TEMP=3D-2731
POWER_SUPPLY_T[  386.922393] omap_hdq 480b2000.1w: hdq_read_byte
IME_TO_EMPTY_NOW=3D900
POWER_SUPPLY_TIME_TO_EMPTY_AVG=3D10860
POWER_SUPPLY_TECHNOLOGY=3DLi-ion
POWER_SUPPLY_CHARGE_FULL=3D858138
POW[  386.937408] omap_hdq 480b2000.1w: hdq_read_byte
ER_SUPPLY_CHARGE_NOW=3D716806
POWER_SUPPLY_CHARGE_FULL_DESIGN=3D1233792
POWER_SUPPLY_CYCLE_COUNT=3D80
POWER_SUPPLY_[  386.951812] omap_hdq 480b2000.1w: hdq_read_byte
ENERGY_NOW=3D2718520
POWER_SUPPLY_POWER_AVG=3D900820
POWER_SUPPLY_HEALTH=3DGood
POWER_SUPPLY_MANUFACTURER=3DTexas Instruments

real[  386.968322] omap_hdq 480b2000.1w: hdq_read_byte
        0m3.267s
user    0m0.002s
sys     0m0.230s
[  386.981445] omap_hdq 480b2000.1w: hdq_read_byte
[  386.991394] omap_hdq 480b2000.1w: hdq_read_byte
root@letux:~# [  387.001861] omap_hdq 480b2000.1w: hdq_read_byte
[  387.012512] omap_hdq 480b2000.1w: hdq_read_byte
[  387.020996] omap_hdq 480b2000.1w: hdq_read_byte
[  387.378234] omap_hdq 480b2000.1w: omap_hdq_runtime_suspend

root@letux:~#=20
root@letux:~# echo -1 =
>/sys/bus/platform/drivers/omap_hdq/480b2000.1w/power/autosuspend_delay_ms=

[  544.714904] omap_hdq 480b2000.1w: omap_hdq_runtime_resume
root@letux:~# time cat /sys/class/power_supply/bq27000-battery/uevent
[  551.704498] omap_hdq 480b2000.1w: hdq_read_byte
[  551.711944] omap_hdq 480b2000.1w: hdq_read_byte
[  551.727844] omap_hdq 480b2000.1w: hdq_read_byte
[  551.735015] omap_hdq 480b2000.1w: hdq_read_byte
[  551.748260] omap_hdq 480b2000.1w: hdq_read_byte
[  551.755432] omap_hdq 480b2000.1w: hdq_read_byte
[  551.768615] omap_hdq 480b2000.1w: hdq_read_byte
[  551.775787] omap_hdq 480b2000.1w: hdq_read_byte
[  551.788604] omap_hdq 480b2000.1w: hdq_read_byte
[  551.795776] omap_hdq 480b2000.1w: hdq_read_byte
[  551.808715] omap_hdq 480b2000.1w: hdq_read_byte
[  551.815887] omap_hdq 480b2000.1w: hdq_read_byte
[  551.828735] omap_hdq 480b2000.1w: hdq_read_byte
[  551.839477] omap_hdq 480b2000.1w: hdq_read_byte
[  551.849578] omap_hdq 480b2000.1w: hdq_read_byte
[  551.859802] omap_hdq 480b2000.1w: hdq_read_byte
[  551.869720] omap_hdq 480b2000.1w: hdq_read_byte
[  551.879913] omap_hdq 480b2000.1w: hdq_read_byte
[  551.889739] omap_hdq 480b2000.1w: hdq_read_byte
[  551.899780] omap_hdq 480b2000.1w: hdq_read_byte
[  551.909667] omap_hdq 480b2000.1w: hdq_read_byte
[  551.919677] omap_hdq 480b2000.1w: hdq_read_byte
[  551.929748] omap_hdq 480b2000.1w: hdq_read_byte
[  551.939727] omap_hdq 480b2000.1w: hdq_read_byte
[  551.949768] omap_hdq 480b2000.1w: hdq_read_byte
[  551.959716] omap_hdq 480b2000.1w: hdq_read_byte
[  551.969787] omap_hdq 480b2000.1w: hdq_read_byte
[  551.979888] omap_hdq 480b2000.1w: hdq_read_byte
[  551.987060] omap_hdq 480b2000.1w: hdq_read_byte
[  551.999176] omap_hdq 480b2000.1w: hdq_read_byte
[  552.007049] omap_hdq 480b2000.1w: hdq_read_byte
[  552.019042] omap_hdq 480b2000.1w: hdq_read_byte
[  552.026977] omap_hdq 480b2000.1w: hdq_read_byte
[  552.039184] omap_hdq 480b2000.1w: hdq_read_byte
[  552.046844] omap_hdq 480b2000.1w: hdq_read_byte
[  552.058288] omap_hdq 480b2000.1w: hdq_read_byte
[  552.065521] omap_hdq 480b2000.1w: hdq_read_byte
[  552.078613] omap_hdq 480b2000.1w: hdq_read_byte
[  552.085815] omap_hdq 480b2000.1w: hdq_read_byte
[  552.098785] omap_hdq 480b2000.1w: hdq_read_byte
[  552.106170] omap_hdq 480b2000.1w: hdq_read_byte
[  552.118682] omap_hdq 480b2000.1w: hdq_read_byte
[  552.126037] omap_hdq 480b2000.1w: hdq_read_byte
[  552.138702] omap_hdq 480b2000.1w: hdq_read_byte
[  552.146667] omap_hdq 480b2000.1w: hdq_read_byte
[  552.159271] omap_hdq 480b2000.1w: hdq_read_byte
[  552.166900] omap_hdq 480b2000.1w: hdq_read_byte
[  552.181365] omap_hdq 480b2000.1w: hdq_read_byte
POWER_SUPPLY_NAME=3Dbq27000-battery
POWER_SUPPLY_STATUS=3DDischarging
POWER_SUPPLY_PRESENT=3D1
POWER_S[  552.199462] omap_hdq 480b2000.1w: hdq_read_byte
UPPLY_VOLTAGE_NOW=3D4012000
POWER_SUPPLY_CURRENT_NOW=3D220447
POWE[  552.210998] omap_hdq 480b2000.1w: hdq_read_byte
R_SUPPLY_CAPACITY=3D82
POWER_SUPPLY_CAPACITY_LEVEL=3DNormal
POWER_SUPPLY_TEMP=3D289
POWER_SUPPLY_TIME_TO_EMPTY_NOW=3D11580
POWER_SUPPLY_TIME_TO_EMPT[  552.227203] omap_hdq 480b2000.1w: =
hdq_read_byte
Y_AVG=3D11040
POWER_SUPPLY_TECHNOLOGY=3DLi-ion
POWER_SUPPLY_CHARGE_FULL=3D858138
POWER_SUPPLY_CHARGE_NOW=3D706660
PO[  552.241851] omap_hdq 480b2000.1w: hdq_read_byte
WER_SUPPLY_CHARGE_FULL_DESIGN=3D1233792
POWER_SUPPLY_CYCLE_COUNT=3D80
POWER_SUPPLY_ENERGY_NOW=3D2680560
POWER_SUPPLY_POWER_AVG=3D8760[  552.257995] omap_hdq 480b2000.1w: =
hdq_read_byte
00
POWER_SUPPLY_HEALTH=3DGood
POWER_SUPPLY_MANUFACTURER=3DTexas In[  552.269348] omap_hdq 480b2000.1w: =
hdq_read_byte
struments

real    0m0.510s
user    0m0.001s
sys     0m0.192s
root@letux:~# [  552.286468] omap_hdq 480b2000.1w: hdq_read_byte
[  552.294067] omap_hdq 480b2000.1w: hdq_read_byte
[  552.305786] omap_hdq 480b2000.1w: hdq_read_byte
[  552.317443] omap_hdq 480b2000.1w: hdq_read_byte
[  552.324645] omap_hdq 480b2000.1w: hdq_read_byte


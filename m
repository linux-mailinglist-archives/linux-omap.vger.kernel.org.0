Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4929E2E79A9
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 14:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgL3N31 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 30 Dec 2020 08:29:27 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:23084 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgL3N30 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Dec 2020 08:29:26 -0500
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDleUXA4E/LE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id 003539wBUDQFFBm
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 30 Dec 2020 14:26:15 +0100 (CET)
Subject: Re: [PATCH 1/3] thermal: ti-soc-thermal: Fix stuck sensor with continuous mode for 4430
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xJmwcUOpoza-LNxTAbRNb9ToERnBNuKboP86DSBdtS61A@mail.gmail.com>
Date:   Wed, 30 Dec 2020 14:26:14 +0100
Cc:     Amit Kucheria <amitk@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: 8BIT
Message-Id: <7C9106E0-FC75-4056-AD5F-16CCFA9C24E5@goldelico.com>
References: <20201230084338.19410-1-tony@atomide.com> <CAHCN7xJmwcUOpoza-LNxTAbRNb9ToERnBNuKboP86DSBdtS61A@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>, Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam and Tony,

> Am 30.12.2020 um 13:55 schrieb Adam Ford <aford173@gmail.com>:
> 
> On Wed, Dec 30, 2020 at 2:43 AM Tony Lindgren <tony@atomide.com> wrote:
>> 
>> At least for 4430, trying to use the single conversion mode eventually
>> hangs the thermal sensor. This can be quite easily seen with errors:
>> 
>> thermal thermal_zone0: failed to read out thermal zone (-5)
>> 
>> Also, trying to read the temperature shows a stuck value with:
>> 
>> $ while true; do cat /sys/class/thermal/thermal_zone0/temp; done
>> 
>> Where the temperature is not rising at all with the busy loop.
>> 
>> Additionally, the EOCZ (end of conversion) bit is not rising on 4430 in
>> single conversion mode while it works fine in continuous conversion mode.
>> It is also possible that the hung temperature sensor can affect the
>> thermal shutdown alert too.
>> 
>> Let's fix the issue by adding TI_BANDGAP_FEATURE_CONT_MODE_ONLY flag and
>> use it for 4430.
>> 
>> Note that we also need to add udelay to for the EOCZ (end of conversion)
>> bit polling as otherwise we have it time out too early on 4430. We'll be
>> changing the loop to use iopoll in the following clean-up patch.
>> 
>> Cc: Adam Ford <aford173@gmail.com>
> 
> I don't have an OMAP4, but if you want, I can test a DM3730.

Indeed I remember a similar discussion from the DM3730 [1]. temp values were
always those from the last measurement. E.g. the first one was done
during (cold) boot and the first request after 10 minutes did show a
quite cold system... The next one did show a hot system independent
of what had been between (suspend or high activity).

It seems as if it was even reproducible with a very old kernel on a BeagleBoard.
So it is quite fundamental.

We tried to fix it but did not come to a solution [2]. So we opened an issue
in our tracker [3] and decided to stay with continuous conversion although this
raises idle mode processor load.

BR,
Nikolaus

[1]: https://lists.goldelico.com/pipermail/letux-kernel/2019-September/003958.html
[2]: https://lists.goldelico.com/pipermail/letux-kernel/2019-September/003975.html
[3]: https://projects.goldelico.com/p/gta04-kernel/issues/928/

> adam
> 
>> Cc: Carl Philipp Klemm <philipp@uvos.xyz>
>> Cc: Eduardo Valentin <edubezval@gmail.com>
>> Cc: Merlijn Wajer <merlijn@wizzup.org>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
>> Cc: Sebastian Reichel <sre@kernel.org>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>> ---
>> drivers/thermal/ti-soc-thermal/omap4-thermal-data.c | 3 ++-
>> drivers/thermal/ti-soc-thermal/ti-bandgap.c         | 9 +++++++--
>> drivers/thermal/ti-soc-thermal/ti-bandgap.h         | 2 ++
>> 3 files changed, 11 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c b/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c
>> --- a/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c
>> +++ b/drivers/thermal/ti-soc-thermal/omap4-thermal-data.c
>> @@ -58,7 +58,8 @@ omap4430_adc_to_temp[OMAP4430_ADC_END_VALUE - OMAP4430_ADC_START_VALUE + 1] = {
>> const struct ti_bandgap_data omap4430_data = {
>>        .features = TI_BANDGAP_FEATURE_MODE_CONFIG |
>>                        TI_BANDGAP_FEATURE_CLK_CTRL |
>> -                       TI_BANDGAP_FEATURE_POWER_SWITCH,
>> +                       TI_BANDGAP_FEATURE_POWER_SWITCH |
>> +                       TI_BANDGAP_FEATURE_CONT_MODE_ONLY,
>>        .fclock_name = "bandgap_fclk",
>>        .div_ck_name = "bandgap_fclk",
>>        .conv_table = omap4430_adc_to_temp,
>> diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>> --- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>> +++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
>> @@ -15,6 +15,7 @@
>> #include <linux/kernel.h>
>> #include <linux/interrupt.h>
>> #include <linux/clk.h>
>> +#include <linux/delay.h>
>> #include <linux/gpio/consumer.h>
>> #include <linux/platform_device.h>
>> #include <linux/err.h>
>> @@ -605,8 +606,10 @@ ti_bandgap_force_single_read(struct ti_bandgap *bgp, int id)
>>        u32 counter = 1000;
>>        struct temp_sensor_registers *tsr;
>> 
>> -       /* Select single conversion mode */
>> -       if (TI_BANDGAP_HAS(bgp, MODE_CONFIG))
>> +       /* Select continuous or single conversion mode */
>> +       if (TI_BANDGAP_HAS(bgp, CONT_MODE_ONLY))
>> +               RMW_BITS(bgp, id, bgap_mode_ctrl, mode_ctrl_mask, 1);
>> +       else if (TI_BANDGAP_HAS(bgp, MODE_CONFIG))
>>                RMW_BITS(bgp, id, bgap_mode_ctrl, mode_ctrl_mask, 0);
>> 
>>        /* Start of Conversion = 1 */
>> @@ -619,6 +622,7 @@ ti_bandgap_force_single_read(struct ti_bandgap *bgp, int id)
>>                if (ti_bandgap_readl(bgp, tsr->temp_sensor_ctrl) &
>>                    tsr->bgap_eocz_mask)
>>                        break;
>> +               udelay(1);
>>        }
>> 
>>        /* Start of Conversion = 0 */
>> @@ -630,6 +634,7 @@ ti_bandgap_force_single_read(struct ti_bandgap *bgp, int id)
>>                if (!(ti_bandgap_readl(bgp, tsr->temp_sensor_ctrl) &
>>                      tsr->bgap_eocz_mask))
>>                        break;
>> +               udelay(1);
>>        }
>> 
>>        return 0;
>> diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.h b/drivers/thermal/ti-soc-thermal/ti-bandgap.h
>> --- a/drivers/thermal/ti-soc-thermal/ti-bandgap.h
>> +++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.h
>> @@ -280,6 +280,7 @@ struct ti_temp_sensor {
>>  *     has Errata 814
>>  * TI_BANDGAP_FEATURE_UNRELIABLE - used when the sensor readings are too
>>  *     inaccurate.
>> + * TI_BANDGAP_FEATURE_CONT_MODE_ONLY - used when single mode hangs the sensor
>>  * TI_BANDGAP_HAS(b, f) - macro to check if a bandgap device is capable of a
>>  *      specific feature (above) or not. Return non-zero, if yes.
>>  */
>> @@ -295,6 +296,7 @@ struct ti_temp_sensor {
>> #define TI_BANDGAP_FEATURE_HISTORY_BUFFER      BIT(9)
>> #define TI_BANDGAP_FEATURE_ERRATA_814          BIT(10)
>> #define TI_BANDGAP_FEATURE_UNRELIABLE          BIT(11)
>> +#define TI_BANDGAP_FEATURE_CONT_MODE_ONLY      BIT(12)
>> #define TI_BANDGAP_HAS(b, f)                   \
>>                        ((b)->conf->features & TI_BANDGAP_FEATURE_ ## f)
>> 
>> --
>> 2.29.2


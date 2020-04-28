Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FECA1BB7D0
	for <lists+linux-omap@lfdr.de>; Tue, 28 Apr 2020 09:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgD1Hhv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Apr 2020 03:37:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51370 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgD1Hhv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Apr 2020 03:37:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03S7bkRO101845;
        Tue, 28 Apr 2020 02:37:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588059466;
        bh=O9oTLB3jQJfcVXDqg1A605+vTcYSVQlvUCOUCgtMw7M=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=JeZv+NxO08ND9ofrlVteGz2EadykJerIiT9RRY7+/iVZ1xCVDbw/1uJyKdJQKCn4Z
         4DZ+BPIhAvUupo9Aded3ywm7n2Zo7Psnf2ZeveU/a0RPF6O71QnHHJ9BOFAWWybZtH
         fL/lQ2za4yuFOGGHcgSoxdA8xo0zlV96lWvtjZag=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03S7bkuw086112;
        Tue, 28 Apr 2020 02:37:46 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 02:37:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 02:37:45 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03S7bhlt121897;
        Tue, 28 Apr 2020 02:37:43 -0500
Subject: Re: [PATCH] arm: dts: am33xx-l4: add gpio-line-names to gpio
 controllers
To:     Drew Fustini <drew@beagleboard.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
References: <20200427233116.GA18917@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <b15f2577-8a7d-4c18-1633-d47133247f49@ti.com>
Date:   Tue, 28 Apr 2020 10:37:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427233116.GA18917@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/04/2020 02:31, Drew Fustini wrote:
> Add gpio-line-names properties to the gpio controller nodes.  The names
> correspond to the AM335x pin names which are also the muxmode 0 signal
> names.  Refer to "Table 4-2. Pin Attributes" in the TI AM335x Sitara
> Processors datasheet:
> 
> http://www.ti.com/lit/ds/symlink/am3358.pdf
> 
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>   arch/arm/boot/dts/am33xx-l4.dtsi | 134 +++++++++++++++++++++++++++++++
>   1 file changed, 134 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> index 5ed7f3c58c0f..1ac574ebfe74 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -157,6 +157,39 @@
>   				#interrupt-cells = <2>;
>   				reg = <0x0 0x1000>;
>   				interrupts = <96>;
> +				gpio-line-names =
> +					"MDIO_DATA",
> +					"MDIO_CLK",
> +					"SPI0_SCLK",
> +					"SPI0_D0",
> +					"SPI0_D1",
> +					"SPI0_CS0",
> +					"SPI0_CS1",
> +					"ECAP0_IN_PWM0_OUT",
> +					"LCD_DATA12",
> +					"LCD_DATA13",
> +					"LCD_DATA14",
> +					"LCD_DATA15",
> +					"UART1_CTSN",
> +					"UART1_RTSN",
> +					"UART1_RXD",
> +					"UART1_TXD",
> +					"GMII1_TXD3",
> +					"GMII1_TXD2",
> +					"USB0_DRVVBUS",
> +					"XDMA_EVENT_INTR0",
> +					"XDMA_EVENT_INTR1",
> +					"GMII1_TXD1",
> +					"GPMC_AD8",
> +					"GPMC_AD9",
> +					"NC",
> +					"NC",
> +					"GPMC_AD10",
> +					"GPMC_AD11",
> +					"GMII1_TXD0",
> +					"RMII1_REFCLK",
> +					"GPMC_WAIT0",
> +					"GPMC_WPN";
>   			};
This misuse GPIO DT bindings:
"
Optionally, a GPIO controller may have a "gpio-line-names" property. This is
an array of strings defining the names of the GPIO lines going out of the
GPIO controller. This name should be the most meaningful producer name
for the system, such as a rail name indicating the usage. Package names
such as pin name are discouraged: such lines have opaque names (since they
are by definition generic purpose) and such names are usually not very
helpful. For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are
reasonable line names as they describe what the line is used for. "GPIO0"
is not a good name to give to a GPIO line. Placeholders are discouraged:
rather use the "" (blank string) if the use of the GPIO line is undefined
in your design. The names are assigned starting from line offset 0 from
left to right from the passed array. An incomplete array (where the number
of passed named are less than ngpios) will still be used up until the last
provided valid line index.
"


Additional note. On other TI SoCs like am437x the same gpio line can be routed to more
than one pin (but only one pin can be used).
gpio0_0 GPIO IO -> A17, D16


-- 
Best regards,
grygorii

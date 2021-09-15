Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0326540C20E
	for <lists+linux-omap@lfdr.de>; Wed, 15 Sep 2021 10:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhIOIyx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Sep 2021 04:54:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhIOIyx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Sep 2021 04:54:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FCCD60527;
        Wed, 15 Sep 2021 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631696014;
        bh=90q4chnHqBl4Fv9eq18MPsgeRlEm6vM07J+DvSqpV8k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gG/35fLu/vYqx/K5P/TVmP3OK5s3iCpU/lbipLiD0pOs65oC8YgtH43Kw9FgH64iD
         PB+YDtQdt4KKN7xhWeoRUbt4HNbXGzcq8P+MpuLBleTHkXf9fseVgaHE2QP8Oheevs
         NSIPZ3m0qCrGdlhtPZKXb1YOnYWuW0yqn6v9WmcAx9kO4f8DdjSMDtMzaub66H6DlF
         cOOwZseFQcW+KemzXC5KSG5FKLWDLNWKQJVXGtGNcsE9Jjpw14K6mmo01XF/VSxYBT
         30nO+dJqNC083uj7NZkAaFX4JmtLq5wgmtUVJtBu35gyB/hqnpI9DIUoPSv8jD4U4Y
         1wS8CQSi0aqJw==
Subject: Re: [PATCH v3 1/8] ARM: dts: omap: Fixup GPMC child nodes
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-2-rogerq@kernel.org>
 <8e29cf74-313f-b8c5-7514-60b5e404833d@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <ff88463e-50f7-7a65-0a40-09ba2e420885@kernel.org>
Date:   Wed, 15 Sep 2021 11:53:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8e29cf74-313f-b8c5-7514-60b5e404833d@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

On 07/09/2021 15:44, Krzysztof Kozlowski wrote:
> On 07/09/2021 13:32, Roger Quadros wrote:
>> Fixes up the GPMC child nodes to prevent dtbs_check errors
>> after device tree binding conversion to yaml.
>>
>> - Use reg address as node name
>> - gpmc,cycle2cycle-samecsen and gpmc,cycle2cycle-diffcsen are
>>   boolean properties.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../boot/dts/logicpd-som-lv-baseboard.dtsi    |  2 +-
>>  .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |  2 +-
>>  .../boot/dts/logicpd-torpedo-baseboard.dtsi   |  2 +-
>>  arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     | 62 +++++++++----------
>>  arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     | 59 +++++++++---------
>>  arch/arm/boot/dts/omap-zoom-common.dtsi       | 16 ++---
>>  arch/arm/boot/dts/omap2430-sdp.dts            |  6 +-
>>  arch/arm/boot/dts/omap3-cm-t3x30.dtsi         |  6 +-
>>  .../arm/boot/dts/omap3-devkit8000-common.dtsi |  4 +-
>>  arch/arm/boot/dts/omap3-evm-37xx.dts          |  1 +
>>  arch/arm/boot/dts/omap3-evm-common.dtsi       |  9 ---
>>  .../boot/dts/omap3-evm-processor-common.dtsi  |  5 +-
>>  arch/arm/boot/dts/omap3-evm.dts               |  1 +
>>  arch/arm/boot/dts/omap3-igep0020-common.dtsi  |  5 +-
>>  arch/arm/boot/dts/omap3-ldp.dts               |  5 +-
>>  arch/arm/boot/dts/omap3-n900.dts              |  2 +-
>>  .../dts/omap3-overo-chestnut43-common.dtsi    |  6 +-
>>  .../arm/boot/dts/omap3-overo-tobi-common.dtsi |  6 +-
>>  .../boot/dts/omap3-overo-tobiduo-common.dtsi  |  8 +--
>>  arch/arm/boot/dts/omap3-sb-t35.dtsi           |  4 +-
>>  arch/arm/boot/dts/omap4-duovero-parlor.dts    |  6 +-
>>  21 files changed, 105 insertions(+), 112 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
>> index 7d0468a23781..f2364cb114c5 100644
>> --- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
>> +++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
>> @@ -65,7 +65,7 @@
>>  		  1 0 0x2c000000 0x1000000	/* CS1: 16MB for LAN9221 */
>>  		  2 0 0x10000000 0x2000000>;    /* CS2: 32MB for NOR */
>>  
>> -	ethernet@gpmc {
>> +	gpmc_ethernet: ethernet@1,0 {
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&lan9221_pins>;
>>  		interrupt-parent = <&gpio5>;
>> diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
>> index 5532db04046c..6357915d207b 100644
>> --- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
>> +++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
>> @@ -4,8 +4,8 @@
>>  
>>  #include "omap36xx.dtsi"
>>  #include "logicpd-torpedo-som.dtsi"
>> -#include "omap-gpmc-smsc9221.dtsi"
>>  #include "logicpd-torpedo-baseboard.dtsi"
>> +#include "omap-gpmc-smsc9221.dtsi"
>>  
>>  / {
>>  	model = "LogicPD Zoom DM3730 Torpedo + Wireless Development Kit";
>> diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
>> index 533a47bc4a53..05049a34b6f1 100644
>> --- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
>> +++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
>> @@ -95,7 +95,7 @@
>>  	ranges = <0 0 0x30000000 0x1000000	/* CS0: 16MB for NAND */
>>  		  1 0 0x2c000000 0x1000000>;	/* CS1: 16MB for LAN9221 */
>>  
>> -	ethernet@gpmc {
>> +	gpmc_ethernet: ethernet@1,0 {
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&lan9221_pins>;
>>  		interrupt-parent = <&gpio5>;
>> diff --git a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
>> index ded7e8fec9eb..2a462cb65a7d 100644
>> --- a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
>> +++ b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
>> @@ -20,36 +20,34 @@
>>  	};
>>  };
>>  
>> -&gpmc {
>> -	ethernet@gpmc {
>> -		compatible = "smsc,lan9221", "smsc,lan9115";
>> -		bank-width = <2>;
>> -		gpmc,device-width = <1>;
>> -		gpmc,cycle2cycle-samecsen = <1>;
>> -		gpmc,cycle2cycle-diffcsen = <1>;
>> -		gpmc,cs-on-ns = <5>;
>> -		gpmc,cs-rd-off-ns = <150>;
>> -		gpmc,cs-wr-off-ns = <150>;
>> -		gpmc,adv-on-ns = <0>;
>> -		gpmc,adv-rd-off-ns = <15>;
>> -		gpmc,adv-wr-off-ns = <40>;
>> -		gpmc,oe-on-ns = <45>;
>> -		gpmc,oe-off-ns = <140>;
>> -		gpmc,we-on-ns = <45>;
>> -		gpmc,we-off-ns = <140>;
>> -		gpmc,rd-cycle-ns = <155>;
>> -		gpmc,wr-cycle-ns = <155>;
>> -		gpmc,access-ns = <120>;
>> -		gpmc,page-burst-access-ns = <20>;
>> -		gpmc,bus-turnaround-ns = <75>;
>> -		gpmc,cycle2cycle-delay-ns = <75>;
>> -		gpmc,wait-monitoring-ns = <0>;
>> -		gpmc,clk-activation-ns = <0>;
>> -		gpmc,wr-data-mux-bus-ns = <0>;
>> -		gpmc,wr-access-ns = <0>;
>> -		vddvario-supply = <&vddvario>;
>> -		vdd33a-supply = <&vdd33a>;
>> -		reg-io-width = <4>;
>> -		smsc,save-mac-address;
>> -	};
>> +&gpmc_ethernet {
>> +	compatible = "smsc,lan9221", "smsc,lan9115";
> 
> This looks like regular override-by-label instead of full path.
> Unfortunately change of the indentation causes difficulties to find the
> real difference - if there is such. Can you split it into separate patch?
> 
> The point is that override-by-label should have zero effect on
> functionality and produce same dtb. This is easy to compare with
> dtx_diff or fdt-decompile but if you mix it with other changes, the
> comparison is not straight-forward.

OK. I will split the overide-by-label to separate patch and ensure there is no
change in compiled dtb for that patch.

> 
>> +	bank-width = <2>;
>> +	gpmc,device-width = <1>;
>> +	gpmc,cycle2cycle-samecsen;
>> +	gpmc,cycle2cycle-diffcsen;
>> +	gpmc,cs-on-ns = <5>;
>> +	gpmc,cs-rd-off-ns = <150>;
>> +	gpmc,cs-wr-off-ns = <150>;
>> +	gpmc,adv-on-ns = <0>;
>> +	gpmc,adv-rd-off-ns = <15>;
>> +	gpmc,adv-wr-off-ns = <40>;
>> +	gpmc,oe-on-ns = <45>;
>> +	gpmc,oe-off-ns = <140>;
>> +	gpmc,we-on-ns = <45>;
>> +	gpmc,we-off-ns = <140>;
>> +	gpmc,rd-cycle-ns = <155>;
>> +	gpmc,wr-cycle-ns = <155>;
>> +	gpmc,access-ns = <120>;
>> +	gpmc,page-burst-access-ns = <20>;
>> +	gpmc,bus-turnaround-ns = <75>;
>> +	gpmc,cycle2cycle-delay-ns = <75>;
>> +	gpmc,wait-monitoring-ns = <0>;
>> +	gpmc,clk-activation-ns = <0>;
>> +	gpmc,wr-data-mux-bus-ns = <0>;
>> +	gpmc,wr-access-ns = <0>;
>> +	vddvario-supply = <&vddvario>;
>> +	vdd33a-supply = <&vdd33a>;
>> +	reg-io-width = <4>;
>> +	smsc,save-mac-address;
>>  };
>> diff --git a/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
>> index 7f6aefd13451..c1e78f929d2b 100644
>> --- a/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
>> +++ b/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
>> @@ -24,36 +24,33 @@
>>  	};
>>  };
>>  
>> -&gpmc {
>> -	ethernet@gpmc {
>> -		compatible = "smsc,lan9221","smsc,lan9115";
>> -		bank-width = <2>;
>> +&gpmc_ethernet {
>> +	compatible = "smsc,lan9221","smsc,lan9115";
>> +	bank-width = <2>;
>> +	gpmc,mux-add-data = <0>;
>> +	gpmc,cs-on-ns = <0>;
>> +	gpmc,cs-rd-off-ns = <42>;
>> +	gpmc,cs-wr-off-ns = <36>;
>> +	gpmc,adv-on-ns = <6>;
>> +	gpmc,adv-rd-off-ns = <12>;
>> +	gpmc,adv-wr-off-ns = <12>;
>> +	gpmc,oe-on-ns = <0>;
>> +	gpmc,oe-off-ns = <42>;
>> +	gpmc,we-on-ns = <0>;
>> +	gpmc,we-off-ns = <36>;
>> +	gpmc,rd-cycle-ns = <60>;
>> +	gpmc,wr-cycle-ns = <54>;
>> +	gpmc,access-ns = <36>;
>> +	gpmc,page-burst-access-ns = <0>;
>> +	gpmc,bus-turnaround-ns = <0>;
>> +	gpmc,cycle2cycle-delay-ns = <0>;
>> +	gpmc,wr-data-mux-bus-ns = <18>;
>> +	gpmc,wr-access-ns = <42>;
>> +	gpmc,cycle2cycle-samecsen;
>> +	gpmc,cycle2cycle-diffcsen;
>>  
>> -		gpmc,mux-add-data;
> 
> Same here and in other places. Actually here a sneaky change is visible
> - different property.
> 
> Best regards,
> Krzysztof
> 

cheers,
-roger

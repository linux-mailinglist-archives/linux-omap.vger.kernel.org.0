Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A5D56CD95
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jul 2022 08:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiGJGyq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jul 2022 02:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiGJGyp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Jul 2022 02:54:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274BD11A1A;
        Sat,  9 Jul 2022 23:54:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5930FB802C6;
        Sun, 10 Jul 2022 06:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABECCC3411E;
        Sun, 10 Jul 2022 06:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657436082;
        bh=dIgWepevShkbAZ0ybK1gU7n6t8V0g0Hx8KnDqNkGoW0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=cIQFgZ1AKkjr1HO54I80NKIHxlLrqNHVr7hZnKAmQNb9L9Kvww9TRdhNdx7XhXEi7
         fMKwm2rLYZ4IDoeAFWxzuJRO4L9DGkd4Ti3GFVeAd3nmuFth7Q58RPT1Dq5VjLAJxl
         hviBCubVw4RfMqm06gGZqBmAL1LpQ3gjMFZIoVdRhxVeoqUJ1HcBwVeP+4+zYMCNYy
         guTghwOal0sRX5rsWT+Jq8If1PPFBtmWpDuZOWNjHxgJ81RrVazYvUIMj5C/47cvgC
         YmRH9/C7DJyth85hJfmDn6+NoxqQMPMoHl/+j/H2VckV6WcPDEqnqNXDWURlqylRPL
         tansrzKfIdk0w==
Message-ID: <c12d9017-41bf-ce13-b0f9-93c608c8c67c@kernel.org>
Date:   Sun, 10 Jul 2022 12:24:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] ARM: dts: am335x-baltos: change nand-xfer-type
Content-Language: en-US
To:     yegorslists@googlemail.com, linux-omap@vger.kernel.org
Cc:     tony@atomide.com, devicetree@vger.kernel.org
References: <20220705122355.14854-1-yegorslists@googlemail.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220705122355.14854-1-yegorslists@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Yegor,

On 05/07/2022 17:53, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Use "prefetch-dma" instead of "polled".
Does using "polled" still cause the issue while Erasing NAND?

> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Acked-by: Roger Quadros <rogerq@kernel.org>

> ---
>  arch/arm/boot/dts/am335x-baltos.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
> index d3eafee79a23..6161c8929a78 100644
> --- a/arch/arm/boot/dts/am335x-baltos.dtsi
> +++ b/arch/arm/boot/dts/am335x-baltos.dtsi
> @@ -197,7 +197,7 @@
>  		rb-gpios = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 */
>  		nand-bus-width = <8>;
>  		ti,nand-ecc-opt = "bch8";
> -		ti,nand-xfer-type = "polled";
> +		ti,nand-xfer-type = "prefetch-dma";
>  
>  		gpmc,device-nand = "true";
>  		gpmc,device-width = <1>;

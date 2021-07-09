Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6053C2B01
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jul 2021 23:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhGIV4i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Jul 2021 17:56:38 -0400
Received: from vern.gendns.com ([98.142.107.122]:33480 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhGIV4i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Jul 2021 17:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/Dddjv2tUyk98nV/3b27ic8yk/7On4PwpqZUZRCFkA8=; b=q6MPWvT4nG5euNmPZ64fqBiwRm
        7tc1FZonw+5/4MB19dnQtEf4VoUtT7PHO4YDxWqfucBxoIWksndCXvTTR+mwilGlhke6rW7mRKavp
        /qU3QOL8Q/gdneAp33DYn0mrYMwsTOpJol5uHwgo00sBNi8Bda3nzA9wFf92E9UyfXInYP/fSMV8K
        M6djUOthxdm+CodZamR13DVmizxv2vHSudAr6h1UMkWfPkf6AjVdEIkq7/tWSAn62+bX2rlgPoA18
        m9WccSa5kDBb5JNCA3jlJ/416dXrI8YN63oE0ObH2pQBKFIwyZMZp/8i1WTVjg/pNcoJZ+KnTCfXu
        X8BPLrzg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:57830 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <david@lechnology.com>)
        id 1m1yLv-00C9xh-37; Fri, 09 Jul 2021 17:48:20 -0400
Subject: Re: [PATCH] ARM: dts: am335x-boneblue: add gpio-line-names
To:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210709214230.1581808-1-david@lechnology.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <ee0e8beb-e128-7d6f-de34-f0adabe3c7b9@lechnology.com>
Date:   Fri, 9 Jul 2021 16:48:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709214230.1581808-1-david@lechnology.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/9/21 4:42 PM, David Lechner wrote:
> This adds gpio-line-names to the BeagleBone Blue DTS. The line names
> are based on the BeagleBone Blue rev A2 schematic.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>   arch/arm/boot/dts/am335x-boneblue.dts | 143 +++++++++++++++++++++++++-
>   1 file changed, 142 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
> index 69acaf4ea0f3..90e8b7d63f79 100644
> --- a/arch/arm/boot/dts/am335x-boneblue.dts
> +++ b/arch/arm/boot/dts/am335x-boneblue.dts
> @@ -435,12 +435,153 @@ &dcan1 {
>   	status = "okay";
>   };
>   
> +&gpio0 {
> +	gpio-line-names =
> +		"UART3_CTS", /* M17 */
> +		"UART3_RTS", /* M18 */
> +		"UART2_RX", /* A17 */
> +		"UART2_TX", /* B17 */
> +		"I2C1_SDA", /* B16 */
> +		"I2C1_SCL", /* A16 */
> +		"MMC0_CD", /* C15 */
> +		"SPI1_SS2", /* C18 */
> +		"EQEP_2A", /* V2 */
> +		"EQEP_2B", /* V3 */

Found a typo already. Sending v2 patch...

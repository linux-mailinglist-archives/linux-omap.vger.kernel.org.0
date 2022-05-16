Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E94528AEB
	for <lists+linux-omap@lfdr.de>; Mon, 16 May 2022 18:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343830AbiEPQtH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 May 2022 12:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343919AbiEPQtF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 May 2022 12:49:05 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF243CA4C
        for <linux-omap@vger.kernel.org>; Mon, 16 May 2022 09:49:03 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24GGmrXj102656;
        Mon, 16 May 2022 11:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1652719733;
        bh=qktgrjVoaFxUx9CraWPW+wRpskJYOZpvrChLo6uU4io=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=rLez7CL8REYe+d5tAwr1A4EMEU9j6U3dC+1DoBOICGEHsm49oClDSx7eUGVpb97gi
         8SF5ZTraiiGbAUup+1jH+erXHc6XJLI16n8H/2dJFqu8iI86StBLTRIa7KyV+2VPmK
         yzrIZYVmkRmmu5gEvHL5vRRP+3ax5O4y7sfGw3xg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24GGmrbT008913
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 May 2022 11:48:53 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 16
 May 2022 11:48:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 16 May 2022 11:48:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24GGmrVs098837;
        Mon, 16 May 2022 11:48:53 -0500
Date:   Mon, 16 May 2022 11:48:53 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Guillaume La Roque <glaroque@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <vigneshr@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <khilman@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am625-sk: enable ramoops
Message-ID: <20220516164853.nai7xbmclvvkywf5@party>
References: <20220516145408.1000678-1-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220516145408.1000678-1-glaroque@baylibre.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16:54-20220516, Guillaume La Roque wrote:
> Enable ramoops features to easily debug some issues
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Changes in v2:
> - Apply script create-mem_map.py  with args given by Nishanth Menon
> - Spelling fix
> ---
>  arch/arm64/boot/dts/ti/k3-am625-sk.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> index 0de4113ccd5d..dfb16c29a000 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
> @@ -36,6 +36,15 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
> 
> +		ramoops@0x9ca00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xe0000000 0x0 0x00100000>;

I think you intended 0x9ca00000 here?

Static checks should have caught this for you. please run them
prior to posting?
> +			record-size = <0x8000>;
> +			console-size = <0x8000>;
> +			ftrace-size = <0x0>;
> +			pmsg-size = <0x8000>;
> +		};
> +
>  		secure_tfa_ddr: tfa@9e780000 {
>  			reg = <0x00 0x9e780000 0x00 0x80000>;
>  			alignment = <0x1000>;
> --
> 2.25.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

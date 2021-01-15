Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F1D2F8100
	for <lists+linux-omap@lfdr.de>; Fri, 15 Jan 2021 17:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbhAOQlA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Jan 2021 11:41:00 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50058 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbhAOQk7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Jan 2021 11:40:59 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10FGe5VM076775;
        Fri, 15 Jan 2021 10:40:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1610728805;
        bh=5V+MEkAw9c7YlFu26NLn+T2YZURYYFvXqdsGTW+sGQk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XdD7hUsA60+KY+XN4VN4EaKMnB0qtXfH41R87QetemIHLZvi4ZbC2lhM7Ql60Bwd8
         n62T0v7dKVWXdPmItA+4nwlUkC1CqJWkl96/p7XKYgTK3aUjy+/Ja5Sgvykr/APVOZ
         qRhPETZK+jeOKloIQLk+VMJzVdWS+N98IWmdy/Og=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10FGe4to013247
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Jan 2021 10:40:05 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 Jan 2021 10:40:04 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 Jan 2021 10:40:04 -0600
Received: from [10.250.34.42] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10FGe33g072987;
        Fri, 15 Jan 2021 10:40:03 -0600
Subject: Re: [PATCH v2] remoteproc: pru: Fix loading of GNU Binutils ELF
To:     Dimitar Dimitrov <dimitar@dinux.eu>, <ohad@wizery.com>,
        <bjorn.andersson@linaro.org>
CC:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20201230105005.30492-1-dimitar@dinux.eu>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <779499cb-b54c-580d-f393-99252277f81c@ti.com>
Date:   Fri, 15 Jan 2021 10:40:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201230105005.30492-1-dimitar@dinux.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/30/20 4:50 AM, Dimitar Dimitrov wrote:
> PRU port of GNU Binutils lacks support for separate address spaces.
> PRU IRAM addresses are marked with artificial offset to differentiate
> them from DRAM addresses. Hence remoteproc must mask IRAM addresses
> coming from GNU ELF in order to get the true hardware address.
> 
> Patch was tested on top of latest linux-remoteproc/for-next branch:
>   commit 4c0943255805 ("Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next")'
> 
> PRU firmware used for testing was the example in:
>   https://github.com/dinuxbg/pru-gcc-examples/tree/master/blinking-led/pru
> 
> Signed-off-by: Dimitar Dimitrov <dimitar@dinux.eu>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
>  drivers/remoteproc/pru_rproc.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 2667919d76b3..5fad787ba012 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -450,6 +450,24 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>  	if (len == 0)
>  		return NULL;
>  
> +	/*
> +	 * GNU binutils do not support multiple address spaces. The GNU
> +	 * linker's default linker script places IRAM at an arbitrary high
> +	 * offset, in order to differentiate it from DRAM. Hence we need to
> +	 * strip the artificial offset in the IRAM addresses coming from the
> +	 * ELF file.
> +	 *
> +	 * The TI proprietary linker would never set those higher IRAM address
> +	 * bits anyway. PRU architecture limits the program counter to 16-bit
> +	 * word-address range. This in turn corresponds to 18-bit IRAM
> +	 * byte-address range for ELF.
> +	 *
> +	 * Two more bits are added just in case to make the final 20-bit mask.
> +	 * Idea is to have a safeguard in case TI decides to add banking
> +	 * in future SoCs.
> +	 */
> +	da &= 0xfffff;
> +
>  	if (da >= PRU_IRAM_DA &&
>  	    da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
>  		offset = da - PRU_IRAM_DA;
> 


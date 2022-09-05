Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9045ACB32
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 08:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbiIEGoN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 02:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbiIEGoL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 02:44:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C0F37FAE;
        Sun,  4 Sep 2022 23:44:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AB042B80EA6;
        Mon,  5 Sep 2022 06:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26C6C433D7;
        Mon,  5 Sep 2022 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662360247;
        bh=tNOrbmYkwxpFMeE3z62iZ8CChhHVktccfKrwAWWarxY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=bSXsL+A7uFTEAqaXXGI/kn93U9hmF7+JCbKoSh0AiTiwzUiV3wnUJvDfgR7IKDbOb
         22e4gIv0UF+ACG6wKHv92WKEE//Dap3KgQrfqZ3S39SiC9fyzH02EUgUoTTr0uAl/5
         75ZzMbpaXMlm6/VoMMxgtwQIAdxuW8fADNZDtrfAtGm4GsbRVBnkFJeJWS/bIsOW9F
         6GxahHmYDL/gY0BVbLHXuNWtH2Poi1Cgpd4WWG7RjNmVaSKyK+j1BlTB+nRNQvxO4X
         rGOpxbm6z0mmlDnbMWzyiQLSuRnoQnOT6hBXNlkS4nUCv9d1/tdjxmhh16z+1TN1FU
         74nsoW/55YOlg==
Message-ID: <9d5182cc-2c2f-287d-b1d4-a4f5fb19788b@kernel.org>
Date:   Mon, 5 Sep 2022 09:44:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 0/3] omap-gpmc wait pin additions
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     rogerq@kernel.org, tony@atomide.com, robh+dt@kernel.org
References: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220902091028.1346952-1-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/09/2022 12:10, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> There is currently no possibility for the gpmc to set either the
> waitp-pin polarity or use the same wait-pin for different cs-regions.
> 
> While the current implementation may fullfill most usecases, it may not
> be sufficient for more complex setups (e.g. FPGA/ASIC interfaces), where
> more complex interfacing options where possible.
> 
> For example interfacing an ASIC which offers multiple cs-regions but
> only one waitpin the current driver and dt-bindings are not sufficient.
> 
> While using the same waitpin for different cs-regions worked for older
> kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY) with
> newer kernels (>5.10).
> 
> Changes since v1: 
>   * Rebase against recent 6.0.0-rc3 kernel, but the maintainers list
>     stays the same!

No... thanks for rebasing yet still you use wrong address email.

> 
>   ./scripts/get_maintainer.pl drivers/memory/omap-gpmc.c
>   Roger Quadros <rogerq@kernel.org> (maintainer:OMAP GENERAL PURPOSE MEMORY CONTROLLER SUPPORT)
>   Tony Lindgren <tony@atomide.com> (maintainer:OMAP GENERAL PURPOSE MEMORY CONTROLLER SUPPORT)
>   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (maintainer:MEMORY CONTROLLER DRIVERS)

Different address email.


Best regards,
Krzysztof

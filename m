Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEFB55C6BC
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237297AbiF1Jnx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 05:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241493AbiF1Jnw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 05:43:52 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95FE525C44;
        Tue, 28 Jun 2022 02:43:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E7487CE1F6A;
        Tue, 28 Jun 2022 09:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CE4C3411D;
        Tue, 28 Jun 2022 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656409428;
        bh=thS9ui805uOCG9IcSSWQ4Iipyz6nbp+j+pITQe+6x6s=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=NEgHDMpubsyaqRktPkNxKRYs44PTuFadcPuXlE1f7H3Xm/oqa4EJNges6S+0lzfwA
         +FMzXCbWc6Tpw7uUQWm3/NbKteKDqe+JbfQe65eP7tjhGHtEuJixUB+Pm5VkYpGwHG
         DbR8fzF/qMZN/oT5GxoaCUIK3Y9Opi/9zK4HgSbwlb7RupvPQSypk8U3hp0Vwog1XP
         B07KyaE9e4N3pqDXsOHV3S5fYlDu8glYF+BEEPpge+PBLAy3K92TGojl2flZ0rzCp1
         cuMdFPm6aAreguokqyfUxibHtVI9uJHIkWkA//KAt6Y5+nxpYrAEdiWxcDHuet30kL
         03XOLjoELrd3A==
Message-ID: <9a4543dd-e441-4803-361f-6fd420bc9a19@kernel.org>
Date:   Tue, 28 Jun 2022 11:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] mmc: sdhci_am654: MMC_SDHCI_AM654 should depend on
 ARCH_K3
Content-Language: en-US
To:     Peter Robinson <pbrobinson@gmail.com>, linux-omap@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
References: <20220628093205.103182-1-pbrobinson@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220628093205.103182-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/06/2022 11:32, Peter Robinson wrote:
> The Texas Instruments sdhci_am654 SDHCI controller is only present on
> TI K3 SoCs so add a dependency to reflect that, plus COMPILE_TEST.
> Also update the help text to reflect the new SoC support added since
> the driver was first added.
> 
> Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654 SDHCI driver")

I don't see a bug to fix, so the tag does not look appropriate.
Otherwise describe how is the bug visible/reproducible etc.

Best regards,
Krzysztof

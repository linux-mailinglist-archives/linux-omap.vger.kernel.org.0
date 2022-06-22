Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18CF3554741
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jun 2022 14:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiFVIxq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jun 2022 04:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355695AbiFVIxj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jun 2022 04:53:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0AF13A
        for <linux-omap@vger.kernel.org>; Wed, 22 Jun 2022 01:53:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C10661913
        for <linux-omap@vger.kernel.org>; Wed, 22 Jun 2022 08:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A322C34114;
        Wed, 22 Jun 2022 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655888018;
        bh=Gi+MBYUmk7fx7Z380ve6bPftXy+UiLPCDBGKB6//M1o=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=sQNfFH6foKo4Sqy6zGA1NVv5OxQNNh2AY7eii4f7HZtQHRb6L9X6bCw3RiXySNuXs
         e0ree6uR3d6eFhrKKES7Pju0r/vnPJ+qMWHKs0upPzkB80U1aS2o6Go3wpOiHBelHQ
         HnaUs1x1bFb35EwF16hpmw+ZZDmS3eIr1crgy+feSVahIfhJY+ikc+8zlo0VRjHJ6i
         eMa6Hc5ac+ETCwDckD66bFjihy6pe+HHXudOHCE6jxaXsHMtp9viQC/ud/3symqCCn
         EqUzWEkAyo2g4x8FzxrBS+LK95b3l9wPAZt6QAPQ28iRVXtb5BkNomJzgNfcbB5A2y
         wKPwet0iINl0A==
Message-ID: <54ba0e78-ad1a-af2b-74de-5db77a022602@kernel.org>
Date:   Wed, 22 Jun 2022 10:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] arm/mach-omap2: Fix refcount leak bugs
Content-Language: en-US
To:     Liang He <windhl@126.com>, tony@atomide.com, linux@armlinux.org.uk
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20220620155421.4076532-1-windhl@126.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220620155421.4076532-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/06/2022 17:54, Liang He wrote:
> We need to add of_node_put() to keep refcount balance for of_find_xxx()
> which will return a node pointer with refcount incremented.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
> 
>  v2:(1) we find several new leak bugs
>     (2) we merge all mach-omap2 related bugs in to one commit
> 
>  v1: we send a patch for each missing of_node_put bug 
> 
> 
> 
>  arch/arm/mach-omap2/display.c      | 1 +
>  arch/arm/mach-omap2/omap4-common.c | 1 +
>  arch/arm/mach-omap2/omap_hwmod.c   | 6 ++++++
>  arch/arm/mach-omap2/pdata-quirks.c | 2 ++
>  4 files changed, 10 insertions(+)

Before applying the patch please check it carefully. Previous evidence
[1] suggests that not it was not even compiled.

[1] https://lore.kernel.org/all/202206221602.odN70SHs-lkp@intel.com/


Best regards,
Krzysztof

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146685548DA
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jun 2022 14:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355446AbiFVIvm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jun 2022 04:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354687AbiFVIvl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jun 2022 04:51:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9624237A00;
        Wed, 22 Jun 2022 01:51:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 51F7EB81C20;
        Wed, 22 Jun 2022 08:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C17C34114;
        Wed, 22 Jun 2022 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655887898;
        bh=DDevuX+quOyUYyRZh8cHS4Ea+lJpMHBEf4QpVKuKGqI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=R9sT8hVrqKIU4PFILSF2ofL07zhVyORlhL80c+LSwVKihfdPmrXTuqBscMbHp7yFZ
         R9B+m7X00LnwS3XQzcsc9sXASZrqSrBiEdE+dcB87wfseQ9hdwJP6hgME7z7sTyrsN
         yRlhkKRJ0qEPNgSml3cow7w9QknJo5SskS2T04pz3dXzH6o0I4s9sYGXpAWsrc0UeJ
         1qpl9SY8ILfsviioo7AqvBBIE6OgcxUTrTWt0uddAIldVsZ6H5fV7NaWnz1oFzMvyv
         PIfOwC5jiS7aF1Q9H225+g5OLuti5tbufq/yG4sLVBCYnVRYZHW5QZLsodFsvIOoPj
         vFenBxegajbGQ==
Message-ID: <d56f0c69-5c70-5539-03aa-5dd28f284a8b@kernel.org>
Date:   Wed, 22 Jun 2022 10:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm/mach: Hold reference returned by of_find_xxx APIs
Content-Language: en-US
To:     Liang He <windhl@126.com>, andre.przywara@arm.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tony@atomide.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220621091937.4082422-1-windhl@126.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220621091937.4082422-1-windhl@126.com>
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

On 21/06/2022 11:19, Liang He wrote:
> In highbank_init_irq(), tegra_init_irq() and omap4_cpcap_init(),
> we should hold the reference returned by of_find_xxx APIs and
> use it to call of_node_put() for refcount balance.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  arch/arm/mach-highbank/highbank.c | 6 +++++-
>  arch/arm/mach-omap2/pmic-cpcap.c  | 5 ++++-
>  arch/arm/mach-tegra/irq.c         | 6 +++++-
>  3 files changed, 14 insertions(+), 3 deletions(-)

Before applying the patch please check it carefully. Previous evidence
[1] suggests that not it was not even compiled.

[1] https://lore.kernel.org/all/202206221602.odN70SHs-lkp@intel.com/

Best regards,
Krzysztof

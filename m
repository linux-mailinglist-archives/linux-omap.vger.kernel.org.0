Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFEAF6124E6
	for <lists+linux-omap@lfdr.de>; Sat, 29 Oct 2022 20:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiJ2S1B (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 29 Oct 2022 14:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiJ2S1B (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 29 Oct 2022 14:27:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F0730541;
        Sat, 29 Oct 2022 11:27:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB6C60B95;
        Sat, 29 Oct 2022 18:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B39FC433C1;
        Sat, 29 Oct 2022 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667068019;
        bh=T6AeQnqwmiCfQHwNRX1h7E9TLa+6NVNkHRBqVTGWtLY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Bw+HRVSXCWTvsdAtrhL4WXRyTiJXkOjfKULx9ohs73TaapHVliI7paJtZQtJTud+3
         uUvVEvtnfQ7/d4jHdG97jJPyu4nlVqL1KFQdjmOPh9Qc5IyFfvKEhOSFy/ZJequ0/m
         uHfLQQk3bd/8BS7HrcGVDvaydVkeCw4it8hzzsVQEYuXIUUkVqnSJQK3emDgKD1Zmz
         swRIUxqwIjqGt09eyMAsNc7tQJ9ESW5GrtzcLCZIFPBmohxW6hIHShlB3RaGmYRDty
         AzeezlUNCPIiMPfPKSPbvS41IhZ21ETx0JunDCksivqZgCn7/cqaBE36yWERiJcyLw
         FC4ueKsQTVrrQ==
Message-ID: <dd37a216-855e-44d4-7ab1-6ecde620312e@kernel.org>
Date:   Sat, 29 Oct 2022 21:26:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 0/2] gpmc wait pin additions
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        tony@atomide.com
References: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20221021081612.591613-1-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 21/10/2022 11:16, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Currently it is not possible to configure the WAIT0PINPOLARITY and
> WAIT1PINPOLARITY bits of the GPMC_CONFIG register directly via
> device tree properties.
> 
> It is also not possible to use the same wait-pin for different
> cs-regions.
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
>   * Rebase against recent 6.0.0-rc3 kernel
>   * Updated eMail recipients list
> Changes since v2:
>   * Remove the gpmc register configuration out of the gpiochip
>     callbacks. In this case the memory interface configuration
>     is not done via gpio bindings.
>   * Some minor code fixes
>   * Changed git commit descriptions
> Change since v3:
>   * Use a uint32 dt-property instean a boolean one
>   * If the dt-property is not set, then don't touch the
>     GPMC_CONFIG register
>   * Changed git commit descriptions
> Changes since v4:
>   * Use checkpatch with "--strict" option
>   * Moved wait-pin sanity checks to gpmc_read_settings_dt()
>   * Always assign WAITPINPOLARITY_DEFAULT on error cases
>   * Track waitpin allocation within gpmc for determine
>     allocation origin
> Changes since v5:
>   * Tracking of wait-pin allocations with polarity change detection
>     * Introduced a new struct gpmc_waitpin
>   * Add GPMC_* to global header definitions
>   * Don't allow GPMC_WAITPINPOLARITY_DEFAULT when parsing dt-properties
>   * Squashed wait-pin-polarity and shared-wait-pin patches, since they
>     should not be separated
> Changes since v6:
>   * Move wait-pin allocation into gpmc_probe()
>   * Fix s/gpmc/GPMC/ in commit description
>   * use ti,wait-pin-polarity instead of gpmc,wait-pin-polarity
>   * Refactored if clause in gpmc_alloc_waitpin()
>   * Revert values for GPMC_WAITPINPOLARITY_ACTIVE_LOW and
>     GPMC_WAITPINPOLARITY_ACTIVE_HIGH.
>     Use the exact same values which are written into the register.
> Changes since v7:
>   * Renamed GPMC_WAITPINPOLARITY_DEFAULT to GPMC_WAITPINPOLARITY_INVALID
>   * Call gpiochip_request_own_desc() only on first wait-pin allocation
>   * Fixed use of old "gpmc,wait-pin-polarity" property.
> 
> Benedikt Niedermayr (2):
>   memory: omap-gpmc: wait pin additions
>   dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
> 
>  .../memory-controllers/ti,gpmc-child.yaml     |   7 +
>  drivers/memory/omap-gpmc.c                    | 122 ++++++++++++++++--
>  include/linux/platform_data/gpmc-omap.h       |   8 ++
>  3 files changed, 124 insertions(+), 13 deletions(-)

for this series

Reviewed-by: Roger Quadros <rogerq@kernel.org>

cheers,
-roger

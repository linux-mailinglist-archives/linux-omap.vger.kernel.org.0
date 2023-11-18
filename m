Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A197EFECE
	for <lists+linux-omap@lfdr.de>; Sat, 18 Nov 2023 11:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjKRKGu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 18 Nov 2023 05:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjKRKGu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 18 Nov 2023 05:06:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CE1196
        for <linux-omap@vger.kernel.org>; Sat, 18 Nov 2023 02:06:47 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFC5C433C8;
        Sat, 18 Nov 2023 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700302006;
        bh=D20eX3kAOzsYMVmXN55tMS6aMwqF1t9X07PsAzLwSnU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QAMKSIounrcGRZfu7U8O3VKjD9wxPNDmotzRLTdv9ezx63FeUlFweY14bFhb2iEig
         IZ8aK8SBrEQv9v4NE9vKVys8zqMuNW7vZMqXqbv+vy8z2PNVMD/SXXTv8/21n26KFZ
         yCwbVz8anmy+4RepD2CM/tahH67F+9uTaE0uJbAwTTeSCbQSLvwR4XQl34F4tGJ/83
         V9JWtJ7aEkPdsbSeewbnt9Yyi3f6ab2MM5G2/oahiu8jnIB4sTgg9rIi1HOjN+pLmv
         K7FVNnxjhU3uMbu98sPzzk4xNbmSudwWYbiE4oKKyE9ONU5jrZcyAKCUGZKM85sXxO
         +aE7uROGF89hQ==
Message-ID: <ffdd3f62-de0b-449b-ac2c-1ed9e9e3070e@kernel.org>
Date:   Sat, 18 Nov 2023 12:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] net: ethernet: ti: cpsw: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Siddharth Vadapalli <s-vadapalli@ti.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Stanislav Fomichev <sdf@google.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Rob Herring <robh@kernel.org>,
        Marek Majtyka <alardam@gmail.com>,
        Yunsheng Lin <linyunsheng@huawei.com>,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
References: <20231117091655.872426-1-u.kleine-koenig@pengutronix.de>
 <20231117091655.872426-6-u.kleine-koenig@pengutronix.de>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20231117091655.872426-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 17/11/2023 11:17, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

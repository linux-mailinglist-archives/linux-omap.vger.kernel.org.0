Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC0B5BA821
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 10:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbiIPIYB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 04:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiIPIXx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 04:23:53 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0991A723A;
        Fri, 16 Sep 2022 01:23:50 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 90CCF581CD8;
        Fri, 16 Sep 2022 04:23:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 16 Sep 2022 04:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1663316629; x=1663320229; bh=edK9bY9Hzw
        EIdM7Fl+qkazDj8MkjWc/PzdrW0HRyN9o=; b=epCplJjn2wHRoby8LyUl2BJb7p
        sK9Z6l5owB4HFOkb7NSAlmmal7LFyzi6ZVTx2o5XeKW6sDsuSsjjQUI0Zj8aFvWB
        G+cG9D39gk0a0q4byhSaJ3DObAiKDDn2OJMF6hriL1K/+14LT02CqNxgFG8+iVjK
        szwZMv7P99Ja955CJZSsQRnkc8nOEcPGN+7eVqKXjGoVs0xT7DBB0kH7YsThxNBq
        6d10rqkrWZT6bwl1Z3BHhMAbRP527W+Hl6CcXbfCCd8dLkCUZJ5SVY3KLFD8Pthz
        4j9cP+HBbV7eZW8lHie5xYoFUbvqrCHWpkIGTtXCQAapqxyGZlRGytI0SCww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1663316629; x=1663320229; bh=edK9bY9HzwEIdM7Fl+qkazDj8Mkj
        Wc/PzdrW0HRyN9o=; b=adcvAIbKs+KSIDeo6udBbhpnfK0lRxgaWvzrdYCi3eov
        YL3u7/Xnb7yW0R9NFROJKrRlfcWSIKsQ8h6VxffsyFQriyYyvtlEl44W9Y5YUycN
        Lzy08q/w2uEsZCQQw8qeswxwLHnDIl+kGTh/HrqjEgMiezhwnzu3wLol4QDOumZT
        RGxW1IfaJRTLeOs5HkZwceUBT9ZEO7WSQyQE/jq31Q4nz1KlTyxirh56ODSYWLjH
        3Z8om9A99SLL3viO1BVdql9Rvo3bckjcXHB4XTB/Yq2sUPQLaQ5WZ5EzWuYl+vGT
        7hmMZes/MS35BmFrDGU5jzx7/1afOEl9f2peMLUKZw==
X-ME-Sender: <xms:lTIkY75zlk8JYoYxtDlC3DSm6bG9biZuaXl69KdpwUiGVVuYHKSfjw>
    <xme:lTIkYw4YKs7V34d9PQmrfmwP433c9Hpagu880FrbTAYIPtjsSr-j6aMtmqA1Fsnsk
    v2NYFH8buEm3qbGBkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvtddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lTIkYycq0eFJLzZQ6uj3KG1EyR_xBp13eA87jnJ8xH1e7gLvgiSvFA>
    <xmx:lTIkY8JoxQQcHn2uL8z2t7WSHA61UnNp_LII7vxEuj7J6AobF-Vosg>
    <xmx:lTIkY_KqR28fe6X0AP7jEWrPH6wwc8_EF8wCynRYIwIiSCCGx0mcpQ>
    <xmx:lTIkY32GDvNSbs_u45izx3nEBZra293VW_DwuDDlBJR3WdxP8UNu0g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 42BA9B60086; Fri, 16 Sep 2022 04:23:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <8202c089-e6dd-4027-a838-f08971b155ce@www.fastmail.com>
In-Reply-To: <20220916082206.167427-1-tomi.valkeinen@ideasonboard.com>
References: <20220916082206.167427-1-tomi.valkeinen@ideasonboard.com>
Date:   Fri, 16 Sep 2022 10:23:28 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     "Linus Walleij" <linus.walleij@linaro.org>,
        "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH 1/2] drm/omap: dsi: Fix excessive stack usage
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 16, 2022, at 10:22 AM, Tomi Valkeinen wrote:
> dsi_dump_dsi_irqs(), a function used for debugfs prints, has a large
> struct in its frame, which can result in:
>
> drivers/gpu/drm/omapdrm/dss/dsi.c:1126:1: warning: the frame size of 
> 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>
> As the performance of the function is of no concern, let's allocate the
> struct with kmalloc instead.
>
> Compile-tested only.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reported-by: kernel test robot <lkp@intel.com>

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

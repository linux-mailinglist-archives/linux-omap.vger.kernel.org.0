Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21806932FF
	for <lists+linux-omap@lfdr.de>; Sat, 11 Feb 2023 19:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjBKSYM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Feb 2023 13:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjBKSYL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Feb 2023 13:24:11 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8AD16AD7
        for <linux-omap@vger.kernel.org>; Sat, 11 Feb 2023 10:24:10 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id e12-20020a0568301e4c00b0068bc93e7e34so2551572otj.4
        for <linux-omap@vger.kernel.org>; Sat, 11 Feb 2023 10:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FjQPrWN6Mx/j9QOWemnThx5RUGniRyLvYrOHyiVrn48=;
        b=Q3JGIQaWJP1nrLKpPCPKIZ3T9NZrdwQepgsQegcz85IBlYyOis0mVwltRLuhkkGlhv
         ai5dWR9q90uyWL3CBxyGcvqByHEFjw4jyDOtb8nt6tbSJqZb2mnZeHerWkx2iQYzHvS1
         WEfER4wkHmpMtTEhK6hufpGFUUV4uo9wEUvemnzscp58gSnRsbhKeC3IBQPV8OhX+vr3
         solQbjQ8BPCNwQEbKKbS2QnHP6KtYWkCb/w6wHs0mGtUv6Sprt0TIGH6pg6ZGxejgkKa
         H56EoKEl0B5qSemCQ+l+TlNbfAzs489lKFm3pG1HtrqgbOMBmL5ThyreZgHIAxuYab7+
         irEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjQPrWN6Mx/j9QOWemnThx5RUGniRyLvYrOHyiVrn48=;
        b=aDCmhdzAepzpCATldofrNQtwrOeNM2ClMt9kKfkaGC8gIhT02v6XBLsL8jq1JfekPh
         lgRztPS3mC6CMQrapLBsUTMRGbj0xouv/PWgF4ObyLNbpTlpdIWQP+DQ2zDdI3RbAS4X
         /pED+ehugKNJmKYvNRch7DE9x8xD9KN6LCU8J24F+MPADdlgB7Aqjc/lC/DYZ2js9cf4
         8DVuQv2XkV81NvpVEUMjzFLiCw7gbsx3ExlvRNGKa3sv2J5lFvr0zAKiqPZhS11f7+0R
         +8Wh78wTKdrb4kGE4muK51cqq22vRTn+65Nu3OL1Zos3Do6dTq3pihyt8afB+TOZa2m8
         loZA==
X-Gm-Message-State: AO0yUKULTJqZf1zFY4KgUCsG3eUl83jIhzkLR2PNqISnBXB7UyFzFNyQ
        4om4u3mRsVBrbAXUFBQFr+M=
X-Google-Smtp-Source: AK7set8NF8acmT6ZtayJ2uk35IHLztdGSUiNgFhlBw/jm/8G/zBwmNr8zYxZoP7QglhE1V2uUJHqHA==
X-Received: by 2002:a9d:7cda:0:b0:68b:e2cd:9362 with SMTP id r26-20020a9d7cda000000b0068be2cd9362mr11725729otn.33.1676139850000;
        Sat, 11 Feb 2023 10:24:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z14-20020a0568301dae00b0068d56f93d73sm3376509oti.26.2023.02.11.10.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 10:24:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 11 Feb 2023 10:24:08 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] ARM: omap1: remove unused board files
Message-ID: <20230211182408.GA898817@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Thu, Sep 29, 2022 at 03:38:56PM +0200, Arnd Bergmann wrote:
> All board support that was marked as 'unused' earlier can
> now be removed, leaving the five machines that that still
> had someone using them in 2022, or that are supported in
> qemu.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

After this patch I can no longer boot the qemu sx1 emulation from mmc.
Is this on purpose ?

Guenter

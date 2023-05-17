Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2454707061
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 20:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjEQSDx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 14:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjEQSDw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 14:03:52 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C4D83
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 11:03:51 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-146-199-nat.elisa-mobile.fi [85.76.146.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QM1FH4P1rzyWs;
        Wed, 17 May 2023 21:03:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684346628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kSPkTuF07nF+e9HynIB9RY9ra4EhzaBNB4/YoBUHc6s=;
        b=UNctltwvbavNDMwofVfRiDrlsGwpqlqf+rwaHFB42t99+/Vmnx9wqxqv/P8RQiz+PgXPEt
        K3EG/Iyxh6i+oMqHuQqpupQhyfe/M4fWIE65VrqNJ+Uassih+KmL05dU1Th43K/oQuZpf5
        TqCcyezxTLJhvViK62ggGHj9yXPDElc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684346628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kSPkTuF07nF+e9HynIB9RY9ra4EhzaBNB4/YoBUHc6s=;
        b=Z6/WY0I6ew8ZMhbH2pNjbbpNgmTyQ9VImgNNze1sI7qsCk69s09q+km9UNSM8ONE1lj+p1
        gqdbexkMOS7O3YORKeubv5tQLEljoOO7bIT0fs5z+Pg2UaFN4tsdrEPuB3ZS/oeFvpnG9m
        vgg10oUddkiKxm24AkSgp5eyPRlberw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684346628; a=rsa-sha256; cv=none;
        b=k08aB3cHcxO2oztD+Tg9h5l6DRVsoYF9Mt81OAbicJEbEhprwU9n5qucqhefCOUDQvZ1hF
        cZ5CjQNbZXhUIoLDoH1MUBSXYHgEmVj/HTJCD2Kfcm9WZQkQYJdA+qjlhKUVrnVPYO2fLX
        AVONEyjcFoy/4IU6jgKgRyId8LjIXd4=
Date:   Wed, 17 May 2023 21:03:44 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: Make serial wakeup GPIOs use descriptors
Message-ID: <20230517180344.GE271152@darkstar.musicnaut.iki.fi>
References: <20230430175130.574971-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430175130.574971-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This patch (now also in gpio-descriptors-omap branch) does not
compile:

On Sun, Apr 30, 2023 at 07:51:30PM +0200, Linus Walleij wrote:
> +		pr_err("No interrupt for UART%d wake GPIO\n" idx + 1);

Comma is missing.                                          ^^^

A.

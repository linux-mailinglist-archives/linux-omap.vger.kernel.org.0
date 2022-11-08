Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2E3621A48
	for <lists+linux-omap@lfdr.de>; Tue,  8 Nov 2022 18:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233702AbiKHRTI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Nov 2022 12:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233882AbiKHRTI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Nov 2022 12:19:08 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1300A25E8
        for <linux-omap@vger.kernel.org>; Tue,  8 Nov 2022 09:19:07 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id y16so21971213wrt.12
        for <linux-omap@vger.kernel.org>; Tue, 08 Nov 2022 09:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFf56fXHcN5swktvY+aK0n5WX8IgDNtgChpp7Zn/EMw=;
        b=LZMzqP8OhgAalFg41YjuQEN/hi06EX3F9dRAqZ1u3mSJ6u9jA4wLIE2oOZ6seXnmku
         7mzHOseABc++gWBA7DUwRzIRI68A6mgdGZuJQKzcd1mSUtTEs5rijiRX3pQTybsIpgFa
         NUyD82SmKVrKzRm/Jp1PcD7faXGL4EjoRQnFnRl8aw3qkdjsk3xwm1F882I4LKGT47GR
         hNQUTChfpzwtJiJ+dol3gjpiZg1m0intCt4g9IHnKLLkSXkdJK0kxANh72y9VsEOeXIA
         8k9HvWs+Sa3djYZpo+LilxIt+32lXTRshYrrEGO3zWtD4n4a5x2P9Y3ri4mam0UrTyYt
         jreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFf56fXHcN5swktvY+aK0n5WX8IgDNtgChpp7Zn/EMw=;
        b=WRxY1Ve2C6yRR/VfCYMiXwwxdOpxjKvD47woiXI2QjvjYugP/GqQLi0E1uq29NQB14
         vHgrolkhKeVnIlvjeZp/BuqTyg0w9H7y67ssKJHRn3ncUcFhj3Uht6B4ovaX/5LkJvEN
         gqLyYBdzfvo5KFBrROseiD/ZUnf/1TX/Z6QiwS7HYD2folaZ3Cm6grDcR0oI1caWQ5Gf
         d/9dL8sGGcF6LN6XZNJaMgGgCCxqDqRG/GOPjyPYTyfhAfE8188xsTT45d4iqb78awLE
         oFG+dxH7ZhJLpzEpaJLRFJwt3cv1r+MDdQdVp3JTheJKp0R8YukX/EGWsEIDDdPAEMYo
         IJqw==
X-Gm-Message-State: ACrzQf2yVfaXeJB/YaNQg2OplFjyBCtfLYrVy5oros05ji/Bw+tiPWF0
        xI8UGIEnn1/1HBC15ey3lePYNKBDTgcfA2EPlSuWiw==
X-Google-Smtp-Source: AMsMyM7Jkn0gWL5gs0/xf6bPZllJz9C5ZuFICxylcZ1ZTH0lc04ZzghM3sDGh/E7Ux3hMxpwSdZCpit2TagIefqQTm0=
X-Received: by 2002:adf:f88b:0:b0:236:7134:d4ec with SMTP id
 u11-20020adff88b000000b002367134d4ecmr34382445wrp.669.1667927945417; Tue, 08
 Nov 2022 09:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20221004143901.130935-1-mpfj@newflow.co.uk>
In-Reply-To: <20221004143901.130935-1-mpfj@newflow.co.uk>
From:   Mark Jackson <mpfj@newflow.co.uk>
Date:   Tue, 8 Nov 2022 17:18:54 +0000
Message-ID: <CAAbcLfiCoa=-20cydPG9=42G9npaeBOCRXPPPTwkNFU-3yGoCg@mail.gmail.com>
Subject: Re: [PATCH] Update Nanobone
To:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        tony@atomide.com, mpfj@newflow.co.uk
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Any update on this patch ?
Did it ever get through ?
Do I need to re-submit for some reason ?

Regards
Mark J.

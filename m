Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD971516F37
	for <lists+linux-omap@lfdr.de>; Mon,  2 May 2022 14:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237530AbiEBMHT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 May 2022 08:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384852AbiEBMHR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 May 2022 08:07:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13AD12AFA
        for <linux-omap@vger.kernel.org>; Mon,  2 May 2022 05:03:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i27so27321208ejd.9
        for <linux-omap@vger.kernel.org>; Mon, 02 May 2022 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BvraXcMQhhymyHIdq03E6zK1tlxz3hLPr3YMYHzyxgI=;
        b=EkVjA0KMPLEAyn83oqpqFjzzjOwC2KvnTqSWPZt40FcS6PZCbwa6YJ3O2B3k8vR0R4
         JW7xs+l/p+DTmiNzeXOAspAujv4C1u3IzZykNT5GVaZwpj+tigLZ9gSk6N31oP9LSE4k
         xpj0rRCaBa2lUCbxyl+3AoWuqUmsXZfz+bjQUvjXHFm3KnKDGgWefdbJMW3tZFzhtlIb
         8DQyaWatNjTnSvlu5YqIMMR/oDFW+0keYRG+cjrrIKruneiudj+QpgqfNWg+Gq/gQoQI
         a1LuowtNyQrVaC+OgnL+tnaarx+/42h4hJ69hFZeZ0q/M3btl/BhsBPEwX54qGIDLsGg
         +kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BvraXcMQhhymyHIdq03E6zK1tlxz3hLPr3YMYHzyxgI=;
        b=aTjijtENGDjiFkPvw0w+OC+86Qpq8SbBfW9CkgYe4cunv6qmZSib3sFZe2P+dopgug
         nN0+Kofq401jxpoH1K4+1zJVZ9mTuB4otIbXntUC2po6um9sLk2RQDw6ln7RdSbVDZkB
         ntLrJeqwzs8Hp5k2R16A1Ky+72peGHST9j2+8wBER4nqo4QHMubv9tZlteg4neFOQjn8
         TYLWkksbn0qs6IdgjfVokQdtOCcFG3RXvWRwtA/jXYiALeML/jZW8w+CphqzobgDI4gx
         qAHMoUiybh2fqnF71Rsd8HbTTNFSBJHOAJfpb5UNr8euk7nfzgeveKApZwWcuKOPX3W5
         4trg==
X-Gm-Message-State: AOAM530bWtPUpjY6ismjyidFn7l3kO7Idea1JvPL2iYahYGhfxW6i9lZ
        YksrXXmYLcwuzEZ+wP0OylrfYzp6XdtqfHvCsYfUDg==
X-Google-Smtp-Source: ABdhPJz6yM0QQAs/T2h9RWc7m+uQVAfJMN9b2Z1Kv6fxjJXOyZzv4WLaruOqIRpzDDROvsZq38PR7L0nMxklBeVtyOs=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr10880445ejc.286.1651493023358; Mon, 02
 May 2022 05:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220428133210.990808-1-arnd@kernel.org> <20220428133210.990808-3-arnd@kernel.org>
In-Reply-To: <20220428133210.990808-3-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 14:03:32 +0200
Message-ID: <CAMRc=MefoxotaCBcXrcH5BemkWVK0Q_SD+YshjTq=Dr=dr2peg@mail.gmail.com>
Subject: Re: [PATCH 2/6] ARM: davinci: remove include/mach/ subdirectory
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Tony Lindgren <tony@atomide.com>, jmkrzyszt@gmail.com,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        shiraz.linux.kernel@gmail.com, Sekhar Nori <nsekhar@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 28, 2022 at 3:34 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The files in include/mach are only used from mach/davinci,
> so they are no longer needed in the traditional location.
>
> Move them to arch/arm/mach-davinci/ and drop the logic for
> the special include path.
>
> The mach/uncompress.h file is not used at all and can just
> be removed.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nice! Thanks for doing this.

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

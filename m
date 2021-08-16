Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5C23EDD45
	for <lists+linux-omap@lfdr.de>; Mon, 16 Aug 2021 20:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhHPSnv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Aug 2021 14:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhHPSnu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Aug 2021 14:43:50 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A45C0613C1
        for <linux-omap@vger.kernel.org>; Mon, 16 Aug 2021 11:43:18 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h11so28651038ljo.12
        for <linux-omap@vger.kernel.org>; Mon, 16 Aug 2021 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tc8LvEjKB125fMvaYu4lvIYEHsbzSNtJpdQim2oDD+w=;
        b=iQi8JqbQuE1XAZgXMTPQ/bq2ZSyLNYvZn4GHu6SXRYH7hMe75T+H4yVrj5+bLj0y/P
         1bhzwOTyC9cDAoezDQaNh9rW9ZhUHP2n58JQVG9peGjJCfxR0s/1MMbESF4B2IuA5tCg
         QIfSTfcM9U6Y427NAhhUvuUz28zeCQFYRwTzY74OTrkzJV/1UcRlKtqLqVETjaQwcNl0
         stpD1FIzlKpjpcpKNX/UVklYyyxWey440cqHOs0/sgY6Vmod/D50ivwlBpj5Y6e2+Q/y
         TXSFOAAAI6xpWc5F6Ui3Kam+3RtI9sSp1Z0eKsnls9Et9XhKnnK3XKaAiyL8HxUNr1o+
         gcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tc8LvEjKB125fMvaYu4lvIYEHsbzSNtJpdQim2oDD+w=;
        b=kKoHuyFrmo3YR0iQA1MRGfif9VYA3yBntOElsUlR9lisIOP2jlJlr0CzBQv0VdB9xu
         kNLUFmhklzy3E+T/QvTAOJngEURpIEvY55vpyYcVbRln+AwEuSC9RppBuaCDa9TA4pMb
         dmXiSFbEtrCe5tbd8vguSEVv/aCvwtgumJZBg4CqOoEuAAZHZT/WewOq9GB+2/xpdnK3
         EQq0WkoQ4rDZqH5w2woxY/evFieWp2H5zcn234zNVwIB/7LS/+DpkqObusCMDZwJ/WTe
         SyFjqVuRPpxWrHJxchszafrI7jeCi5/kjtXQkc1aZ8DGrttfSr2/r8BMvLIi/6MtQHL/
         iCfg==
X-Gm-Message-State: AOAM532+ijU3VPh9YrNL2xkesPICaxc0kvbLhKckMQjXVP5+5J7aQ+fL
        BpRVo+Ub0CkPOaNhrH7XJ6OIH1ndqQuRy0J+qttbSg==
X-Google-Smtp-Source: ABdhPJxh2J/gfj4uaNJSi+hQ4c8sGsIdVmOD7cbnGyOdIh3lGXQ2f0SdgCyg3NVunsSvPOSfgxwlymzCJCztsFWubLY=
X-Received: by 2002:a2e:94cb:: with SMTP id r11mr61720ljh.116.1629139396718;
 Mon, 16 Aug 2021 11:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210815191852.52271-1-nathan@kernel.org>
In-Reply-To: <20210815191852.52271-1-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Aug 2021 11:43:05 -0700
Message-ID: <CAKwvOdknYUxe1dHW-muGr=ZJc=hCKBrfhZCNQR9tEJTwr0fK=Q@mail.gmail.com>
Subject: Re: [PATCH] bus: ti-sysc: Add break in switch statement in sysc_init_soc()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Aug 15, 2021 at 12:19 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit a6d90e9f2232 ("bus: ti-sysc: AM3: RNG is GP only"), clang
> with -Wimplicit-fallthrough enabled warns:
>
> drivers/bus/ti-sysc.c:2958:3: warning: unannotated fall-through between
> switch labels [-Wimplicit-fallthrough]
>                 default:
>                 ^
> drivers/bus/ti-sysc.c:2958:3: note: insert 'break;' to avoid
> fall-through
>                 default:
>                 ^
>                 break;
> 1 warning generated.
>
> Clang's version of this warning is a little bit more pedantic than
> GCC's. Add the missing break to satisfy it to match what has been done
> all over the kernel tree.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/bus/ti-sysc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 0ef98e3ba341..afe8222db7cd 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -2955,6 +2955,7 @@ static int sysc_init_soc(struct sysc *ddata)
>                         break;
>                 case SOC_AM3:
>                         sysc_add_disabled(0x48310000);  /* rng */
> +                       break;
>                 default:
>                         break;
>                 }
>
> base-commit: ba31f97d43be41ca99ab72a6131d7c226306865f
> --
> 2.33.0.rc2
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210815191852.52271-1-nathan%40kernel.org.



-- 
Thanks,
~Nick Desaulniers

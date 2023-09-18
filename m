Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6867A5485
	for <lists+linux-omap@lfdr.de>; Mon, 18 Sep 2023 22:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjIRUyj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Sep 2023 16:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjIRUyi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Sep 2023 16:54:38 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FF010F;
        Mon, 18 Sep 2023 13:54:32 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6561c09ead6so26573566d6.1;
        Mon, 18 Sep 2023 13:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695070471; x=1695675271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JKOIoxjAMpIMhlbFLnI66RFMTxES9Lx9Tg51O/hoxQ=;
        b=DAWne48y9mrma4iHxVLNNejLW5EsAzip9NtC1NIkZNplCo2yw4KSLT89Yw6mX0W7b4
         HH8QsJepoCJjrb+SpGSHnBDYXohusfHtXocAPI1JbfSFUXhP3GooeaLyBpnDIcD8rM/u
         aZosC0f31Y83UpW5vYRtqlIFgKPZJ43mhxXI65IYZl/xz79DpDBP76xPEKcL7dS1m44f
         Nv2idHX8akVzsLHu0FQNIre8HzjNTnmnyfMsFC2rWhAGpeiQtCghCNedS7v1PEOpIzcc
         s+WMJWeF58c3rsFGt1hGCr5iQwOwl1EGX8EdBe4O2x/hp/KlOlgebOfYylv+7yq5xqmm
         cwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695070471; x=1695675271;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JKOIoxjAMpIMhlbFLnI66RFMTxES9Lx9Tg51O/hoxQ=;
        b=AoujEkolbwdbmb3dpbNxkerab1sVRwPcgEcZnG6AcivIcFm65tVwBXo7Po/16S2ed/
         GUfNmq6q0KLHnC+hpb8CNanKLDId4iFQ4zb3o4tCAxN/h9fSrYB/VU3CfckmJ6MfIWKd
         uhof2eghBZeE4UtIT1ERS9SxoIFznIDDwxwlNvSYne++pBMt//TfK+SU1XwpZwZMnB9/
         X6Ba+Dv7K/OoUZyiRUXqbD5XEn2vqKPSSKC9DRc0afAUVrt2Vt6sWFsiTVpbRbjSJgH1
         ocizWXQhOHyvX3SuY3BaGY+ry8lTl9tF7oPwgFm6G7Zub09xRLihjHpNWzkXGQx9ugnb
         YCog==
X-Gm-Message-State: AOJu0Yx2zpEnwkyytmKDxXTmGLoQYD0gS4LjO0wd3MHAJH3PrC1fVlTM
        d/J3eLQVHJiV7/sEKr2yaL8=
X-Google-Smtp-Source: AGHT+IEeDcfxx5E7MUkRKktvg+P5mdOgPZw4O5XC0zUqrlKQT2E6ixUqyqYrH9qxnPAEOXW5th/aOw==
X-Received: by 2002:a0c:e4c9:0:b0:658:574:5b84 with SMTP id g9-20020a0ce4c9000000b0065805745b84mr4277949qvm.6.1695070471526;
        Mon, 18 Sep 2023 13:54:31 -0700 (PDT)
Received: from [10.67.49.139] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w26-20020a0ca81a000000b00655e2005350sm3745460qva.9.2023.09.18.13.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 13:54:30 -0700 (PDT)
Message-ID: <05cfcbdd-ebc2-b494-4d18-f643e436a80c@gmail.com>
Date:   Mon, 18 Sep 2023 13:54:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH net-next 49/54] net: ethernet: ti: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Wei Fang <wei.fang@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
        kernel@pengutronix.de, linux-omap@vger.kernel.org
References: <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
 <20230918204227.1316886-50-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230918204227.1316886-50-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/18/23 13:42, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert these drivers from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/net/ethernet/ti/cpmac.c        | 6 ++----

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com> # cpmac
-- 
Florian


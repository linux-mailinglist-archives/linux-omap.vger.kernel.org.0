Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0FB77BFDA0
	for <lists+linux-omap@lfdr.de>; Tue, 10 Oct 2023 15:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjJJNgg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Oct 2023 09:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbjJJNgg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Oct 2023 09:36:36 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B883A9
        for <linux-omap@vger.kernel.org>; Tue, 10 Oct 2023 06:36:34 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c93507d5so4620887b3.2
        for <linux-omap@vger.kernel.org>; Tue, 10 Oct 2023 06:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696944994; x=1697549794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wXiqvYDT0weE8ui/Sbgni0MhTf5BD51PKqeFfPGPxw=;
        b=n6W295mv4kAxT9n/ho2+UbufdEmNyndozwP6FgRjEa8aH0Mjk/ceZTEENT/j9bmCUJ
         E8bJPfBqw3kNOvwfw2CyxoQleamYkajrCK4DTw48dYp2mxLdwokgvjmcjLmubwaCFiRk
         nYMwFSdP0xkXnHVvzj+1585P7bkPbcw7kBbupIA7HmUa99FWZF8VQIrOcWJZtFdGFiH5
         R7DGskUmFA9ERrkGf6HbrtAz5Z/oMTct98b8HA1v19P26AjCaIsrf/QMsAeQVy6nMPkj
         sL1J+dzSYsTybPwMzx+HKmvklAxDkoogQ2LwnkJ4P4WhdKCf8R5BbiF2guApA1upY+jr
         S4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944994; x=1697549794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wXiqvYDT0weE8ui/Sbgni0MhTf5BD51PKqeFfPGPxw=;
        b=h7eag/G6mWizkdJHzvZHb30Qr8BGBOQgodzC8Oj/3vRMv0zYtnbbwmZhho0uRvGfcF
         e5lWCWLSaz16nPfxW4T/RxGsDy3YbYkxc6b2IyqPyxtMPIfVYidFM+SAutoxt5l3qIuz
         AYnhNznFaw9RLj3rWmv+UU3g025+dlpqx1fSFEE96J9zM3KX0ne6EklaLOjv6/tfB55k
         cwUOB/qou9+phwkqsWQ2mHZ9tAdlpkOviw7u/e091S696Qw7ASKYS0/Lx8k0Zkr9xWzP
         ZeyKpliS2kpleW4jVtj1kk4/XscS6brYggwjcamz2iI/nNWhgwzXP0fcqOb1GV+gACb7
         gfXw==
X-Gm-Message-State: AOJu0Yw8gp2Dd7Uf0SpRl1dzxOXCKVdPMul4n5Fyn0tET6g+AWWbjUg7
        RMDf0FV1m62hhpFuZ+DKjXU+scVYgAMUwbKzXGhPlQ==
X-Google-Smtp-Source: AGHT+IHsWswayOAuTJAjdAMTyZ+dNvJUEXkXvz/1XH+y4Ttw4D9hAMEjlNkq1LxFqqsRR7ICw5yWWKwX0zI5mhbxKh8=
X-Received: by 2002:a0d:cc90:0:b0:5a7:d016:bffa with SMTP id
 o138-20020a0dcc90000000b005a7d016bffamr634809ywd.8.1696944993840; Tue, 10 Oct
 2023 06:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-3-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:36:23 +0200
Message-ID: <CACRpkdYq0_kYJUyb90nFmW9SRrphQggepLP-OXdHeEWN4b9xcw@mail.gmail.com>
Subject: Re: [PATCH 02/20] pinctrl: single: Drop if block with always false condition
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:


> pcs_remove() is only called after pcs_probe() completed successfully. In
> this case platform_set_drvdata() was called with a non-NULL argument and
> so platform_get_drvdata() won't return NULL.
>
> Simplify by removing the if block with the always false condition.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B72D746D08
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jul 2023 11:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjGDJTJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jul 2023 05:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbjGDJTI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jul 2023 05:19:08 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704D5C9
        for <linux-omap@vger.kernel.org>; Tue,  4 Jul 2023 02:19:07 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso6274174276.2
        for <linux-omap@vger.kernel.org>; Tue, 04 Jul 2023 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688462346; x=1691054346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tpa9u4AybWborcZk5odwSVr1HLiyouOB79fuClqylbc=;
        b=Kxe6GKZvQQGUjCajFuUzsu525IHVy/6Av6BiKctM84dDaCwiFR7jh2xYH37vmBai+K
         3bGXDwHrA9k1URARJ8lIMW3nV0z2/5C+eDd6oURmvbUQ3e5OuVhmePC0Jr/y7GBwEvub
         j+P5S7XZSXp0uNu23+HGrQtb4I/wFUyFReeRmEv6N6XR9wg3Pfe5S/MnNtrjSRmSqV0z
         aQKw7j8tMItDFR1xRd6y5QccnYkJxAmcGi2K6/xS1EY4uoLiNOZhsVcuOmYQ4X1v21yT
         nl6VcCJR7RbO1QLKl8io/QW/36NsCAS0ItqKdteGksPw2Bt7XyH4CoLejch5b5JzLOUu
         m65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688462346; x=1691054346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tpa9u4AybWborcZk5odwSVr1HLiyouOB79fuClqylbc=;
        b=CI6CXXdRgY/h0HEUG3r88nyKL+HeVJsHEKKIhw89B4DrRBbzaRik3jOCrGEgr4kpyt
         GhqALXCVjn8S0yWfMbaF/4iOO1dHolHcqRumIl11Eq1fG4SuR+2nuWIxMSXFWIouPt39
         2sgk/PgjCeTgz+a12sIiK9bMRr8Qx4QPDk1RKaBRhMC2BucnL4ozruKY4EbWLoNBBVaI
         ki2ztQp3hHwG/TS/OrgFMAWtsa++uNjeeAHd/Sb28cGoTGUFHbMD6GIH0Uc9rObcIsEF
         IeRWLPdKbQQ77wewSBaDb18VeqZJ1ATNLrPpXQl3qrD9mkJaerGCgfemJ/OqBhmLBKPQ
         gSvQ==
X-Gm-Message-State: ABy/qLYVYhf/QKRz/940iux+cNd+QL0jRlXDB1ZEzXEKqXw1XUfzIytF
        f5EQrRqLYZqreKO8M0wv1WLLPoTs3dVAocbYbOAdlmg6HmXdn433
X-Google-Smtp-Source: APBJJlG9QC7I441QNVv/EfT76fvo6eOP6FY+KJaEHxtT+hw4goQdyM2f3P8x0Kwhdzrf5zHUh8rz6JzXhqaXg0yhGEU=
X-Received: by 2002:a05:6902:347:b0:c4b:41ce:f68b with SMTP id
 e7-20020a056902034700b00c4b41cef68bmr9272349ybs.41.1688462346631; Tue, 04 Jul
 2023 02:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230703081716.15810-1-guomengqi3@huawei.com>
In-Reply-To: <20230703081716.15810-1-guomengqi3@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jul 2023 11:18:55 +0200
Message-ID: <CACRpkdaW5j0mRbwv7rvAKiwBBe_bArqCKRv+UPCPxwX8GJ3Qkg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
To:     Guo Mengqi <guomengqi3@huawei.com>
Cc:     tony@atomide.com, haojian.zhuang@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jul 3, 2023 at 10:24=E2=80=AFAM Guo Mengqi <guomengqi3@huawei.com> =
wrote:

> In a reliability test which repeatedly load and remove a module,
> I found some kmalloc-256 memory leaks in pinctrl-single.
>
> pcs_dt_node_to_map() will recognize a dt_node and
> make a mapping for it. Along the way some pinctrl functions and groups
> are registered in pinctrl-single controller. These functions/groups are
> registered once and not removed during the system lifetime.
>
> When the client module loads again, pcs_dt_node_to_map() fail to consider
> this situation, create the same set of resources, and does not release or
> use them.
>
> To fix this, add a check at the start of pcs_parse_one_pinctrl_entry/
> pcs_parse_bits_in_pinctrl_entry. If the target is found,
> then all the resource allocation and parsing work can be skipped,
> just set the mapping with existing function/group information.
>
> Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree
> based pinctrl driver")
>
> Signed-off-by: Guo Mengqi <guomengqi3@huawei.com>

Good catch!

I expect Tony to review the patch in-depth.

> -static int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
> +int pinmux_func_name_to_selector(struct pinctrl_dev *pctldev,
>                                         const char *function)
>  {
>         const struct pinmux_ops *ops =3D pctldev->desc->pmxops;

It appears you need to add EXPORT_SYMBOL_GPL() for this function
so the module can build. (This is why the build robot complains.)

Yours,
Linus Walleij

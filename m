Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7BE707420
	for <lists+linux-omap@lfdr.de>; Wed, 17 May 2023 23:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjEQVXM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 17:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjEQVXI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 17:23:08 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00F19011
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:22:52 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-561c9635241so14998207b3.3
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358571; x=1686950571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qmC+HAjequn2iikZaBRrDhDszAYM9CIyUoNraFzS1A=;
        b=GyW6mnuWnvMnTFZLH8etib6dA9wpgA4J9CmFc+aZ9gRoxi/eQwYhEBM+NqUJyKBL+T
         aMktK0eQp4vFFeXZ+xZLfilYUESmmubp5ni+z/9tA2pa2R+NyhkIiAJiPbDlzie2ksbH
         JKJG+W5p16X4AIJ+etYc/S+t1pbooQl4/TZEFmJ1X2+IXBZxD3lORvleraAV1iYZfaBZ
         0aRngk5z+mU2hpVhxpdUXp85dYv5hAY6kyS58rwaszCZS5e0Fd/v3AxaFRC044eR+ZKU
         Pqvnvmx+D2Itlo6rLsWQmuqqk19i3ZUN4nMKv382X66oc9njp9SCd/DiyMdxSB4dAxmz
         s7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358571; x=1686950571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qmC+HAjequn2iikZaBRrDhDszAYM9CIyUoNraFzS1A=;
        b=Wn9btd7Ev00CzCAX706NlEq4FgdtVfS977MPCtVzMzT7LSg1lz58c9gZ4935mNJAcY
         Bpm0SvkR9NznFUQyPn62OmX3lReJziobZWhHPFXGtd3enRJTtkWN0rNXvhbHu33TTReu
         /jMUtcKIvcpj2CP91OFdTpm2JxQozwYKdwKmKxWWdCSA5rFuMztYQkTW5t7nC34pxryA
         la7O0PFWAIv9cW97hTt6R0i2RLZIKd2glxx1qm4lkpBWZAkX8bEGeu7qYhplVsg4uyYq
         7IcBi8xFoucoRiOZE954E0kgtnCNWDZYdNiXuTiROMg4UeSjhuGeu6HTupedHMXHI8cc
         KJtA==
X-Gm-Message-State: AC+VfDyHISYoSUJDCV0HFDXMVPreDUxwRnRYRA7c7vYM5opCb5SnQ4yT
        dU9dZxFbCH70gpg/aoKKX8aHUvianiteShkPgVlg4g==
X-Google-Smtp-Source: ACHHUZ6WVYfXq9MxUCdMf7/S8H6GSkwdZVuGgcz7WgPsZxR+QjJ66AYw8SZL+flJoXLvYutrr9iXd6oSH6ir/KIuUF4=
X-Received: by 2002:a0d:db52:0:b0:561:bd81:bbaf with SMTP id
 d79-20020a0ddb52000000b00561bd81bbafmr3257946ywe.20.1684358571385; Wed, 17
 May 2023 14:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230517212118.2141542-1-linus.walleij@linaro.org>
In-Reply-To: <20230517212118.2141542-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 17 May 2023 23:22:40 +0200
Message-ID: <CACRpkdZYw+=oUfO-m-kq1Z+mWO3xQBbgygV_g=DVYj=PY9-FBA@mail.gmail.com>
Subject: Re: [PATCH v3] Input: ads7846 - Convert to use software nodes
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
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

On Wed, May 17, 2023 at 11:21=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:

> ChangeLog v2->v3:
> - Fix up CBUS GPIO swnodes.
> - Add compatible to the ads7846 touchscreen properties

Should be v4->v5, sorry for the confusion.

Yours,
Linus Walleij

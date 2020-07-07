Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17501216B2A
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 13:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgGGLN1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 07:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728224AbgGGLN0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jul 2020 07:13:26 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEE3C08C5DF
        for <linux-omap@vger.kernel.org>; Tue,  7 Jul 2020 04:13:26 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k17so11700788lfg.3
        for <linux-omap@vger.kernel.org>; Tue, 07 Jul 2020 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DonQkpNAjPvHVAy79oehvm61+vwAXrm714g+O9PzNZA=;
        b=TO49RncxH1IHsqYy4SyeMCPtM239Wd3esWklEchNM7cIvvWU8d22p9X+tt275U1fRS
         QqEEj2tGMso79rUK8yQboBeqO7EOEDIn+AJP6k4nNnwlXsiYqtzfhbrl3kHQPTy/Yg2g
         BdKs03I3DUY1Wu9v63xIkJx6xZK9ao09gx1KMJokoYvlekJIDtjeHgr9dG6UIXla7Gsl
         1qM/+lnWDQRPxNzzSitTNYUDJyokjMxbg5R7oC9Hj0K2aB3oCYilUnuLygGZfB7853lR
         i75e5Pi0QsdbsXzNMqijd5nrzs3k0iaH4atcp+LQy3p3kkBZ8X+jUEYy/7jb9cAt16Ew
         BiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DonQkpNAjPvHVAy79oehvm61+vwAXrm714g+O9PzNZA=;
        b=KwzIeWQvial9R9dkOgcVKjeweqQCAzPIIjCsJzN/Sb9vSoZW8GijbjajmZ3yZjFPzW
         ZvkDttZJ1XOzKA2PcoZdtudvPyjUO6LdqRd8VgPSIRvt/04I9XEHjgqjXB4hdHh0xJPL
         8GvfcAyz3SNThelJby5dHD/r5wcb79APd6qtjXdW0W+HUQim5LaVnOwTq1aM5IqymsJn
         1NxauFSubalsi3nwp39cuOL79tRE+YdJ/I0qokvG58ceha0Jx4M+v41Kr4K9btmyMPAj
         55pT6IjCOo5m1sbNb3HklS0XHPEzXsQeKI0Js7X/xTIzjyk52cRjBL8YBRUwtg5PI9v6
         OLuA==
X-Gm-Message-State: AOAM5304FEd6LqxQdtEsiSAGZ3JZRBBT/PbYbJlzSLRVDg8tjeyFG/wx
        pBFLGECkOJKzxayLST3lpgdUUBB9h+vuxCXBzB+t+Q==
X-Google-Smtp-Source: ABdhPJzwS5f0cvxfzHQbNMbpX81A+XQqU02t1sjlsXR6wKo7CCNC6u99RIC3QWt6g9P+mZRBN/2h2q03IPJWnOOnYNU=
X-Received: by 2002:a19:f20a:: with SMTP id q10mr33042436lfh.89.1594120404530;
 Tue, 07 Jul 2020 04:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200617180543.GA4186054@x1>
In-Reply-To: <20200617180543.GA4186054@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 13:13:13 +0200
Message-ID: <CACRpkdYN+N8cuFtgqeqk_L4QR0ZMUObYehEBTfnGGe1aR9srBA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: single: fix function name in documentation
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Jiri Kosina <trivial@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 17, 2020 at 8:05 PM Drew Fustini <drew@beagleboard.org> wrote:

> Use the correct the function name in the documentation for
> "pcs_parse_one_pinctrl_entry()".
>
> "smux_parse_one_pinctrl_entry()" appears to be an artifact from the
> development of a prior patch series ("simple pinmux driver") which
> transformed into pinctrl-single.
>
> Fixes: 8b8b091bf07f ("pinctrl: Add one-register-per-pin type device tree based pinctrl driver")
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2:
> - add trivial@kernel.org
> - add Fixes: tag

Patch applied as non-critical fix (v5.9).

Yours,
Linus Walleij

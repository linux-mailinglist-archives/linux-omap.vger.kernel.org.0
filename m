Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9CE202671
	for <lists+linux-omap@lfdr.de>; Sat, 20 Jun 2020 22:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgFTUnQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 20 Jun 2020 16:43:16 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41732 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbgFTUnP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 20 Jun 2020 16:43:15 -0400
Received: by mail-lf1-f65.google.com with SMTP id c11so7479179lfh.8
        for <linux-omap@vger.kernel.org>; Sat, 20 Jun 2020 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lcFxZDJV0JE7EILOFQLnvdmPuPHbFA43GAORC1SuIgc=;
        b=UJDRoyXfza9eu6l9hI9fr7ez3X/6F/4uo85Ob3sf281CMgHH3m+Mtx913shdmjDCe0
         wzT1brbPxl7u1YLem58YAbAa4VpZFhvnGvMihW/TlnF6bZ1DoH/Wu+ayNVzRC6yB28kw
         7TlBjKeoqPAGw7KP7ahp3CrVxtxGP+gXNgau75MLjl6u/z5yMPZf5QKKEy7le2fxjfjk
         q92+piYiIAsi8zTdAD0tFoH7sTEIpefFXSn3742nZAZBLtDSIGpF65YMY/aPDU7SHUs+
         M/HOxh1ELVqvlSqscMPa0KBYOA8R8J5zdAbxcXIxdltWl0DL8oMAxbyMonfdoQHqtsRR
         oLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lcFxZDJV0JE7EILOFQLnvdmPuPHbFA43GAORC1SuIgc=;
        b=kTTOerajuWo8RCWvJXfWiTfMKkGbUE+SKI/5I0Qhr1vIFZN2YNbglSBuyQLgF19OoW
         RhURS6i0E7DSoWfc3W44L7R8fFTE8cCYwg9aEXI8wTl7q+/xdXvrLqZwcQq02+ww53aT
         XcoObR4LFTIRrYL0M7/w2EemdGLR1SOOltl1ySmc5NEOB3scbIe7KkpATGzGKe2FFc3p
         /SNX3P0z9n0F+vmSHdlskst4vNwUSbqXw0lYgbKhVABHK8zkpzcxAQ1JGBvrZ0/ViXXQ
         6vuUmBzfWvOn+3/C44ybo4v1qfa/Fz+4Xs7OW02LPJJH1qE02PyqAxziuJPuS21MSJhe
         vV5g==
X-Gm-Message-State: AOAM530Py7WX6PS732jCe1KniE9u+H52YalRLKUJwNxWRKEQGqmDuvGV
        wU7PU84U3YhGc0WBF4utdDdnQOF6aNdza9a0lX5pbw==
X-Google-Smtp-Source: ABdhPJxYtAEDvRBSpp8tdmOckarOes/SsxhEPpZ0qNeeF/xp2t4qLjK5NUS7m1mNGy9cL9z49GKsu9JGaSMlrHxtXso=
X-Received: by 2002:a05:6512:31ce:: with SMTP id j14mr1633403lfe.47.1592685732304;
 Sat, 20 Jun 2020 13:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200612112758.GA3407886@x1>
In-Reply-To: <20200612112758.GA3407886@x1>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 22:42:01 +0200
Message-ID: <CACRpkdY8u8DxtO9nv5_Y17H3cs+ExvUOGEhmwWqz34q-QTRNtg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: single: fix function name in documentation
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 12, 2020 at 1:28 PM Drew Fustini <drew@beagleboard.org> wrote:

> Use the correct the function name in the documentation for
> "pcs_parse_one_pinctrl_entry()".
>
> "smux_parse_one_pinctrl_entry()" appears to be an artifact from the
> development of a prior patch series ("simple pinmux driver") which
> transformed into pinctrl-single.
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Patch applied for fixes.

Yours,
Linus Walleij

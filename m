Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9439D6F6AF5
	for <lists+linux-omap@lfdr.de>; Thu,  4 May 2023 14:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjEDMNr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 May 2023 08:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjEDMNq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 4 May 2023 08:13:46 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4B55FD3
        for <linux-omap@vger.kernel.org>; Thu,  4 May 2023 05:13:44 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-b9d8b2e1576so557944276.2
        for <linux-omap@vger.kernel.org>; Thu, 04 May 2023 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683202424; x=1685794424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Nz4N7dBdEb2mhhYgRb5Ac4u0WnwPfPfvIfQEz/oEYw=;
        b=qXqX6HaLiyrnJBChHeBKAzAM0vEPq7TbgRHZmOwkhPcM1GakZW/ItPgWR/1Oxue1sq
         cIQu/c6Te65Z6dExIcbTmK56lU8phMg7PhezCdVW01BBBZHUgp1ZKWGGn5qeH6nnbuup
         WaQrY9cQ0IxucKvfSKHdn582Lw1aATNnMQbM5p8jhmClkRAxphauBfnB2jbMtqG/Mbdg
         nYRvSlUJHZQ1KCee/9iJU0aTK9Ocu7E14ijm767M5v5YStjfGynNY7RKqbh7V9aCwG7/
         R8XTpaRviX4SAFpYAgJ/n8CxrUgqgUL5QY598WnmHCY6w2dSR5iihskgnaRLQOXn+zJQ
         JnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683202424; x=1685794424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Nz4N7dBdEb2mhhYgRb5Ac4u0WnwPfPfvIfQEz/oEYw=;
        b=h0Ak/0sNxl6qquDqjykQeyfiSTLtYd+5KrQQIb1sbpauWEDKeksYgyBVNdvZTHJdZ7
         aiTrQWdzM1Gt/IHPKMlqoBsrJuDy3dXXpKhUcYc8YNB/vk26I5K/2zDb/CMQ1xEIBFxV
         wVDgyYltGEqXWpjZo/ftcHWLWynQiTpwuoDzFY7VZBqeXmelg4axxOZsyuWvxHNRfUzb
         z7vaeMlGYTHDjjjIo+tKm2U+l/UdjCIAqfJkAsPX7FZMGczIdVSTbcgTBeeHn0eY4Wkx
         OmZM/SgBkwAqm/E4nI4lioXi/EyFjcCa4YzgvzgzLcsSHfAB65cHtJdUeiL//WqLwhNI
         7cEQ==
X-Gm-Message-State: AC+VfDzlCtc6Vb9g9rTAfbqNOcx6earNbjNYIicy/EXev5FeQVGgwLoO
        trHe1d5Popy/6twmHbe6ARE6ImqzYfqV2wq0uSmqJg==
X-Google-Smtp-Source: ACHHUZ7tC86v2dmQ/+32Ze+s5HIZkFWybkq5UTok2Fe2Q+hGI7uuxQK7pXSEjtNakF83A5FXhyVV12KWSUK8lqUIixE=
X-Received: by 2002:a25:41ca:0:b0:b97:e31e:47b with SMTP id
 o193-20020a2541ca000000b00b97e31e047bmr21780417yba.62.1683202423837; Thu, 04
 May 2023 05:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230425173241.GF444508@darkstar.musicnaut.iki.fi>
 <20230425201117.457f224c@aktux> <20230425183857.GG444508@darkstar.musicnaut.iki.fi>
 <20230425212040.5a4d5b09@aktux> <20230425193637.GH444508@darkstar.musicnaut.iki.fi>
 <20230425215848.247a936a@aktux> <20230426071910.GE14287@atomide.com> <20230504055156.GO14287@atomide.com>
In-Reply-To: <20230504055156.GO14287@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 May 2023 14:13:32 +0200
Message-ID: <CACRpkdY9ShRATHa776KyzeArmQdKxdwGxJC11YnmhWiCdSGzEA@mail.gmail.com>
Subject: Re: [BISECTED REGRESSION] OMAP1 GPIO breakage
To:     Tony Lindgren <tony@atomide.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 4, 2023 at 7:52=E2=80=AFAM Tony Lindgren <tony@atomide.com> wro=
te:
> * Tony Lindgren <tony@atomide.com> [230426 07:20]:
> > Seems that we should just revert this patch for now and try again after
> > the issues have been fixed.
>
> Looking at the proposed fixes being posted seems like they are quite
> intrusive.. How about we partially revert this patch so omap1 still
> uses static assigment of gpios?

I think Andreas patch (commit 92bf78b33b0b463b00c6b0203b49aea845daecc8)
kind of describes the problem with that: the probe order is now unpredictab=
le,
so if we revert the patch then that problem returns, but I don't know how
serious that problem is.

It's one of the reasons why we can't have static GPIO bases anymore FWIW.
The only fix that would actually fix the problem would be to undo deferred
probe and the ongoing work to determine probe order from the device
tree resource tree, and it is way too late for that, it's just not possible=
.

Yours,
Linus Walleij

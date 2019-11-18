Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C81100EC6
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 23:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfKRWaM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 17:30:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:60588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbfKRWaM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 17:30:12 -0500
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 814DD22312;
        Mon, 18 Nov 2019 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574116211;
        bh=khxFIvRa0WHBu3BPSpSp4o8e8vlX/Ch1fJFSYdneD1g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B8LWMYXp1+IGaUXr0uhktgBFNAO0EUQPoDl4ZO6KXa4ZuxKz1lc+Klt9zdeMN0Byg
         A1qBk27AObhn8bnOiT+nmyy4ea74+Q1yhe6THBpSc0wQG2Sn5mcYM39u5I80spCYXR
         H3MTMAbeFuLriXNtdbEuyRFTN/Yx4Z587oUMbUtc=
Received: by mail-qv1-f45.google.com with SMTP id cv8so7142352qvb.3;
        Mon, 18 Nov 2019 14:30:11 -0800 (PST)
X-Gm-Message-State: APjAAAVADF5dd3czrJ+fG0j2g0SkLnGQV2hZQ+a+5mePJ0RZTNkAIM4g
        IFQNi2qzgjZigG8f75N8E/0XQtQ3M7C0LOMqLw==
X-Google-Smtp-Source: APXvYqwTs2co+HBbq2oe5+YXOU23+vJDFGQ7niNbj9Q1SHsVHHK3eLM9UQAJDYzQb4QVp4Z73nckDWhocRD43GBWIEg=
X-Received: by 2002:a0c:d2b4:: with SMTP id q49mr15752471qvh.135.1574116210565;
 Mon, 18 Nov 2019 14:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20191114101817.20831-1-peter.ujfalusi@ti.com>
In-Reply-To: <20191114101817.20831-1-peter.ujfalusi@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 18 Nov 2019 16:29:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLahJZ0TqmgNS_cvwtTUw4kRCjD2bn-vdAN8xYmM7zY0w@mail.gmail.com>
Message-ID: <CAL_JsqLahJZ0TqmgNS_cvwtTUw4kRCjD2bn-vdAN8xYmM7zY0w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: Move ti-dra7-atl.h to dt-bindigs/clock
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Nov 14, 2019 at 4:17 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>

typo in subject.

> Most of the clock related dt-binding header files are located in
> dt-bindings/clock folder. It would be good to keep all the similar
> header files at a single location.
>
> Suggested-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  Documentation/devicetree/bindings/clock/ti/dra7-atl.txt | 4 ++--
>  arch/arm/boot/dts/dra7-evm-common.dtsi                  | 2 +-
>  arch/arm/boot/dts/dra72-evm-common.dtsi                 | 2 +-
>  include/dt-bindings/{clk => clock}/ti-dra7-atl.h        | 0
>  4 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/dt-bindings/{clk => clock}/ti-dra7-atl.h (100%)

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

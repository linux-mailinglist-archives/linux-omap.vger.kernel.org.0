Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDE9AB88A
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 14:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404675AbfIFM5L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 08:57:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:51840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404455AbfIFM5L (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Sep 2019 08:57:11 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1E98208C3;
        Fri,  6 Sep 2019 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567774631;
        bh=NL02bNQfH90Jrh+T8P44tgOkFtizvrx9wmPax7o59to=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vDMxptgHsUae7s7z00ld+VjzFkQDdCjcUSozl7tLfuvMQHWN3Rn35I8UJpOTQP1n1
         +x1TCX+cwuFwmBTss46FBiUWuHnvvt5X+2eAm3Eas/565ha+NwrLKikC8q4IDQAQXU
         ORP3TBiGUU6g2gSv1iHZQ4I4hqdZ9Mg41OurrDmg=
Received: by mail-qt1-f178.google.com with SMTP id b2so6888295qtq.5;
        Fri, 06 Sep 2019 05:57:10 -0700 (PDT)
X-Gm-Message-State: APjAAAW1wdr+Yeiij3L5x0SJGVVr6CU2mqgqvKtXRDe8/DhcPUMxEzUJ
        p6rkVCshDjsze3vkqUoXY5/uitcbEXetCMoblA==
X-Google-Smtp-Source: APXvYqyDk0WFHsHVbn49ivVXFxlgtYthvW6nlgjYDlf1/VbP/QyxY/nRvcooxFGw9uRPTPZaOoDz4E2YHy7hCWtcbLg=
X-Received: by 2002:ac8:31b3:: with SMTP id h48mr9073369qte.300.1567774630183;
 Fri, 06 Sep 2019 05:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190830121816.30034-2-t-kristo@ti.com> <20190906103558.17694-1-t-kristo@ti.com>
In-Reply-To: <20190906103558.17694-1-t-kristo@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 6 Sep 2019 13:56:58 +0100
X-Gmail-Original-Message-ID: <CAL_JsqLHTsEz6RJSi3rZ9AKyTBc00abyAxqwG8B9zAqL6cnv+w@mail.gmail.com>
Message-ID: <CAL_JsqLHTsEz6RJSi3rZ9AKyTBc00abyAxqwG8B9zAqL6cnv+w@mail.gmail.com>
Subject: Re: [PATCHv4 01/10] dt-bindings: omap: add new binding for PRM instances
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 6, 2019 at 11:36 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> of these will act as a power domain controller and potentially as a reset
> provider.
>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v4:
> - renamed nodes as power-controller
> - added documentation about hierarchy
>
>  .../devicetree/bindings/arm/omap/prm-inst.txt | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt

Reviewed-by: Rob Herring <robh@kernel.org>

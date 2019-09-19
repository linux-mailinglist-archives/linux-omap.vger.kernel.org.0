Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB85B81F5
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 21:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389652AbfISTyw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Sep 2019 15:54:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:42426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387854AbfISTyw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Sep 2019 15:54:52 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACC9721924;
        Thu, 19 Sep 2019 19:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568922891;
        bh=NKeHsjE9y7nzQ8bAyeySvn4Pq7CKSbTu+e+36rl6Wxo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BcSOxA+eFw++/YClQslyED8fMsXKHPPI8vtL84o6dVNJAIbQRkqdc1w565fVgGX3/
         nYbL7F4fSNBPFIqXi8g3tmc33ZotDgNvGMfGYMLtNS8fGm9e5wvoN8HX0b2emp5GKj
         2x53yfrJ0Ar7a+L1vi7eYnnul08bUUK+N+zmHc3Q=
Received: by mail-qt1-f180.google.com with SMTP id 3so3391248qta.1;
        Thu, 19 Sep 2019 12:54:51 -0700 (PDT)
X-Gm-Message-State: APjAAAXXzIxZ1n52F6LkFDOwyE0z7CxF+vGLY3fz6hlPjrJ5GIf1ELYc
        AUyopqox0WKHekNckzw56RJacJdiGZCoGp/B7A==
X-Google-Smtp-Source: APXvYqz+8osRNXbt3CtV46VPmD8JNxl+29Q1bDc72UZd/+b0HeyXjy+hyOaYu5e/za8SVmBxq3mr0divdiMrmZGdnw4=
X-Received: by 2002:ac8:444f:: with SMTP id m15mr5229280qtn.110.1568922890902;
 Thu, 19 Sep 2019 12:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190917174817.GA27938@bogus> <20190919123001.23081-1-t-kristo@ti.com>
In-Reply-To: <20190919123001.23081-1-t-kristo@ti.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 19 Sep 2019 14:54:39 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+x93K9=L4s6ZdmsDb__==kP36WbM_WY1pB-_QNPOhsGw@mail.gmail.com>
Message-ID: <CAL_Jsq+x93K9=L4s6ZdmsDb__==kP36WbM_WY1pB-_QNPOhsGw@mail.gmail.com>
Subject: Re: [PATCHv6 01/10] dt-bindings: omap: add new binding for PRM instances
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 19, 2019 at 7:30 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> Add new binding for OMAP PRM (Power and Reset Manager) instances. Each
> of these will act as a power domain controller and potentially as a reset
> provider.
>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v6: added common compatible as per request from Tony Lindgren. This is
>     to simplify the support code in patch #10 of the series slightly
>
>  .../devicetree/bindings/arm/omap/prm-inst.txt | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/omap/prm-inst.txt

Reviewed-by: Rob Herring <robh@kernel.org>

Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B1B47C62F
	for <lists+linux-omap@lfdr.de>; Tue, 21 Dec 2021 19:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241112AbhLUSQs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Dec 2021 13:16:48 -0500
Received: from mail-qt1-f176.google.com ([209.85.160.176]:38557 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236895AbhLUSQs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Dec 2021 13:16:48 -0500
Received: by mail-qt1-f176.google.com with SMTP id 8so13676966qtx.5;
        Tue, 21 Dec 2021 10:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G0KLH304We2MtMeBL/gdhtdUVOVD7h4sXFGBXYegnBM=;
        b=t8oEebsA8JJolu1+4YPTp1lg5egHgOoDBnd3gTtmKwsU/7ZebBAVj9NS5OpZkyGGUR
         iy/IUIxYi2uDuI39t8xec8ljJDDT6PJP+EgNS9Pr4lJuA3Tt1m06LptP24xnTjzz/lYE
         HhPbyIG6grFOGSJkQAvY0BWsrhKXNrYwNuKCuubYju4Z26pVcMeMM+TZnOxhuMgrtLKd
         7POUVR43ekU2jIbL/czLgzjv3dJnn2uCAzf879zu8AW1L18NZOv1oAXJoG+tvWI8vrS6
         k59mCPmiKcnQhUgW2X6BRbww4XGO8ZLeVWcxsgZVSux6X79ixnbpoOaGvKxYdHoOi82Y
         xbfQ==
X-Gm-Message-State: AOAM533B0N0Jiv8Nko3Qj1dbTw0omqyb3jFCuVjjsEWPNFZL+jp+JTRX
        Oe/22ZVELzEFuSyXap9gdQ==
X-Google-Smtp-Source: ABdhPJxU/XZuQaoJrTmtYNT7dGJy/XVcyEQjGA8n5/Xtt5hdqe+f4BHwin3LXW8AIpwqisAEkANHTA==
X-Received: by 2002:a05:622a:291:: with SMTP id z17mr3428875qtw.138.1640110607139;
        Tue, 21 Dec 2021 10:16:47 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id v20sm14557335qkl.123.2021.12.21.10.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 10:16:46 -0800 (PST)
Received: (nullmailer pid 1523952 invoked by uid 1000);
        Tue, 21 Dec 2021 18:16:43 -0000
Date:   Tue, 21 Dec 2021 14:16:43 -0400
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        linux-omap@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: ti: Move dra7 clock devices out of the legacy
 section
Message-ID: <YcIaCxu1zgp4WsD1@robh.at.kernel.org>
References: <20211217115559.15352-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217115559.15352-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 17 Dec 2021 13:55:58 +0200, Tony Lindgren wrote:
> I accidentally added some dra7 clock defines to the legacy section that
> we want to stop using. Let's move the defines to the right location.
> Note that this is just a cosmetic fix.
> 
> Cc: linux-clk@vger.kernel.org
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tero Kristo <kristo@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  include/dt-bindings/clock/dra7.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

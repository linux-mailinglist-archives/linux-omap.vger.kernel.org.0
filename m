Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC78342468E
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 21:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239144AbhJFTQO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 15:16:14 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:38803 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhJFTQN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Oct 2021 15:16:13 -0400
Received: by mail-ot1-f50.google.com with SMTP id c6-20020a9d2786000000b005471981d559so4423155otb.5;
        Wed, 06 Oct 2021 12:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uKvpGuwsKeTIxTNYlo+8dztssa33mpEFTpr2uQKniTU=;
        b=Hbkveepx0cdSs3X8zIPxIUfkyUMy7pYGwjFK2wfR/AEswmXIAG0Bu6R6wt/KxGu0dc
         ncbDDSoEZvOO5tAmWGuMevBpVjwmWtaA979KG0n2G2mBBSJp4+j14mPlK5+LZCf1SfZa
         R1rxvmIhv31+iOsxXQ575tsdXdlLnRtHL+atCw6oG88HM8gRDQlpH5Jj5kXvC/yAgG6p
         PguTxdlfDPlkkZRToHTJlHzxh/6Cio7RENsc6wtceKf3VT2I9a2hfAVCyzmw6IDwpBQB
         cDYgDpOlnI7GRKUxN2Eo1GLDJ/sO/Vpiw8C+SnU9d8RoxlWR0Fr/4FBKtXUYGFsevTWL
         yd3Q==
X-Gm-Message-State: AOAM532VNg7z6ieFJ+owP94Lq8D0hG07Wn67/QaT4H/fcAoCU5r21mXQ
        AbZQva+UC+tQnx8rHaQD0N6eb+2F6A==
X-Google-Smtp-Source: ABdhPJwzlwIDmTJpik07Uag6ZIs+cG+/4eBcgGtQ9XCAC/73CH6JKVNckBVD5iVhT9BTnO3jqlUs4Q==
X-Received: by 2002:a9d:6c91:: with SMTP id c17mr3988otr.114.1633547660627;
        Wed, 06 Oct 2021 12:14:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id ay42sm4335696oib.22.2021.10.06.12.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:14:20 -0700 (PDT)
Received: (nullmailer pid 2248765 invoked by uid 1000);
        Wed, 06 Oct 2021 19:14:19 -0000
Date:   Wed, 6 Oct 2021 14:14:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, vigneshr@ti.com, robh+dt@kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: 8250_omap: allow serdev subnodes
Message-ID: <YV31i4pONQCYKGAK@robh.at.kernel.org>
References: <20211001211731.2923066-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001211731.2923066-1-andreas@kemnade.info>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 01 Oct 2021 23:17:31 +0200, Andreas Kemnade wrote:
> additionalProperties: false
> ignores the pattern matching for serdev objects in serial.yaml, causing
> error messages when serdev subnodes like bluetooth or gnss devices are
> defined. Using unevaluatedProperties instead is the correct way
> if arbitrary children nodes can appear.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/serial/8250_omap.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

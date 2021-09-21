Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F08413BA0
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 22:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbhIUUpL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 16:45:11 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:41509 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235038AbhIUUpL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 16:45:11 -0400
Received: by mail-ot1-f48.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso268725ota.8;
        Tue, 21 Sep 2021 13:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L07hQ1b9j/e6t5cbfVZEdTBHXu+ODfYJ4V0bxjmgq4Q=;
        b=E5QEsCHON4kP4kaJPmRVL/OI1Q6gcJ5gsfQ144PbmFHLG6abaPG4jprIG91uUpzoru
         8ueVhZ1CzURjKpHtPPsZpT4+EmqFjtxMGqb8vEsvmZ+EkIfJ5qj7Ytd8xn6ql98sTxAI
         LlPo80ptJ9RSqfL0Tss1oDEFFnRkWabAZOSiFbn8ZsyPTgU+EScsVke5kjtqR9AfyGa4
         VqlH0DPCBXJ+yVFWxhyJvrOAb4DVTxViW6F1iOcxZSL6u4fTSVARM7NPPLQ451QsOjUX
         JzCjFQeRKkA2WXCXz5VG9B7+NMsS/dQX9SwdOvPlYwDWxFw5P1CpEVerCf/jIlaI0q9I
         qe7g==
X-Gm-Message-State: AOAM531k/M3HOg3AF9hgDEFeM5VUiF3wnzvC9TuXWpy654nL9QCT5bJc
        oAD47LG9sE/R5Y6Db3zfWg==
X-Google-Smtp-Source: ABdhPJy8Vb5MDCTiDpKSkStvWFDG4J+xUwMgTQ9K9brhTc/HsBkWGXoxaoj5hzT1dqsEZiAtAXefbg==
X-Received: by 2002:a9d:4b83:: with SMTP id k3mr5106252otf.234.1632257021856;
        Tue, 21 Sep 2021 13:43:41 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id c24sm14277otf.71.2021.09.21.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:43:41 -0700 (PDT)
Received: (nullmailer pid 3295272 invoked by uid 1000);
        Tue, 21 Sep 2021 20:43:40 -0000
Date:   Tue, 21 Sep 2021 15:43:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        nsekhar@ti.com, krzysztof.kozlowski@canonical.com, nm@ti.com,
        linux-kernel@vger.kernel.org, tony@atomide.com, robh+dt@kernel.org,
        miquel.raynal@bootlin.com, grygorii.strashko@ti.com,
        lokeshvutla@ti.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 5/8] dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
Message-ID: <YUpD/CvFZ8WO7pI/@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-6-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-6-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 14 Sep 2021 15:27:02 +0300, Roger Quadros wrote:
> Convert gpmc-nand.txt to ti,gpmc-nand.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 ------------------
>  .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 121 ++++++++++++++
>  2 files changed, 121 insertions(+), 147 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

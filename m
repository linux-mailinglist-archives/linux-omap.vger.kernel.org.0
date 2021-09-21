Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E740413B87
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 22:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbhIUUjw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 16:39:52 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37618 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234921AbhIUUjw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 16:39:52 -0400
Received: by mail-ot1-f50.google.com with SMTP id w64-20020a9d3646000000b0054716b40005so301773otb.4;
        Tue, 21 Sep 2021 13:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s0hCVXKHoNUGYO2rOrlkceofb8qBLeKfxXe120uadrM=;
        b=ROkPdsem8wCMbsUUfKSRhS+QY1lyOfHpaWjO5f+RUk+aOjDbq/9Y3c0JFMKJd7XwYu
         GNz53IyCHViU/DnU1St5qneOxVrsFax4hwJeadEEdUaqCQkLJN+lr9wxwwYnKVlJnadG
         yX326yflvOZPCg6CcKK9ZnlwJUIrei0YlFoZ7yCEg38wEd6tk9CJ9TlEngPOdw+FcWpM
         cNus6YkskmxrOkC+FbbvZ8z9K6hEVgXm39dSOxDCL4cMilubxIyrX2YVZ9e8QCKvGjav
         YQqBhhYenV5d8tdbidqHEZRxyKBxdytTlA3K65aeQ+4hevuF/XuTAPloIUBq9IqatTP7
         MMDg==
X-Gm-Message-State: AOAM533G+8defAvawNNp/bQrT2/J1USJ2JQBYtrtvK1cQaFLtG51+YzW
        Vf2LHftgL/nRaELSHBKoyQ==
X-Google-Smtp-Source: ABdhPJxb8SjwgoWMU0sKmvW7UYVj9lzYNrUbsYB/MFhxnHuQzWDgUPsF943512sRTDwXp8ODWc26TQ==
X-Received: by 2002:a05:6830:34b:: with SMTP id h11mr27633636ote.319.1632256703179;
        Tue, 21 Sep 2021 13:38:23 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com. [192.154.179.36])
        by smtp.gmail.com with ESMTPSA id a3sm21559oie.3.2021.09.21.13.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:38:22 -0700 (PDT)
Received: (nullmailer pid 3288151 invoked by uid 1000);
        Tue, 21 Sep 2021 20:38:21 -0000
Date:   Tue, 21 Sep 2021 15:38:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, miquel.raynal@bootlin.com,
        linux-omap@vger.kernel.org, grygorii.strashko@ti.com,
        tony@atomide.com, nm@ti.com, linux-mtd@lists.infradead.org,
        nsekhar@ti.com, linux-kernel@vger.kernel.org, lokeshvutla@ti.com
Subject: Re: [PATCH v4 3/8] dt-bindings: net: Remove gpmc-eth.txt
Message-ID: <YUpCvdZ+z7P4fZED@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-4-rogerq@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-4-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 14 Sep 2021 15:27:00 +0300, Roger Quadros wrote:
> There is no GPMC Ethernet compatible or device driver. GPMC is
> just a bus interface over which devices like Ethernet controller
> can be to.
> 
> For SMSC 911x Ethernet chip bindings, please refer to
> Documentation/devicetree/bindings/net/smsc,lan9115.yaml
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/net/gpmc-eth.txt      | 97 -------------------
>  1 file changed, 97 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

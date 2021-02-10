Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1591317399
	for <lists+linux-omap@lfdr.de>; Wed, 10 Feb 2021 23:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhBJWqH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Feb 2021 17:46:07 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:33590 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhBJWqG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Feb 2021 17:46:06 -0500
Received: by mail-ot1-f47.google.com with SMTP id c16so3467129otp.0;
        Wed, 10 Feb 2021 14:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cLfp4vSswyuWmvez+k7dSjR25plYWYjX5QWVBX7NjG0=;
        b=hpIZBSaOTeFMvvt8FfT4VwNpasUx/8qyft1VOKxbnqBzR2BKyCCl2bnqPX3gYx5HPj
         6KYrSjQ9mrd242LvQgDETUroDFMYHxvoeKHTQQGBolM3medkBtB0Ge14ds7kgQlQtzEw
         kX8HwcBjbkXOn4vJEZhCGDx88l6IuoCCiFDUJNh4Ft6jVS2GFJYi4FPZsI4elI5R1+ap
         8RMdyo9z8cUQ37Yt7+khXS0mBeb+lfqits9+UCdrwPSVCdwVN93NcUNaDAtMFEWuSTpn
         pV1l50gvugqWOQTC/SvHx7rMXX8octCCzYtxulrNtlt4Z+MkUQUcLclrAxXVxMdyHhlt
         SgnQ==
X-Gm-Message-State: AOAM532CrUiodxZdlH7hyoMLryuVverOv2nYNrqMlANpMD9VgYQWG5n7
        kTxa1C7BLiCqhAwUYjZlLQ9Qi48lfw==
X-Google-Smtp-Source: ABdhPJxgIfhR/NHTUmAdgkuSkx+W5xseE3vW+L+ZM5omynBqOahP2u1Uzh0xHceLAWdzYthtb94llA==
X-Received: by 2002:a9d:5f05:: with SMTP id f5mr3725087oti.234.1612997125173;
        Wed, 10 Feb 2021 14:45:25 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 203sm763260oie.14.2021.02.10.14.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:45:24 -0800 (PST)
Received: (nullmailer pid 2951847 invoked by uid 1000);
        Wed, 10 Feb 2021 22:45:23 -0000
Date:   Wed, 10 Feb 2021 16:45:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: omap: Update binding for
 AM64x SoCs
Message-ID: <20210210224523.GA2951762@robh.at.kernel.org>
References: <20210209193643.24824-1-s-anna@ti.com>
 <20210209193643.24824-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209193643.24824-2-s-anna@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 09 Feb 2021 13:36:42 -0600, Suman Anna wrote:
> Update the existing OMAP Mailbox binding to include the info for
> AM64x SoCs. There are some minor IP integration differences between
> the AM64x SoCs and the previous AM65x and J721E SoC families.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: Remove AM64x example as per Rob's comments
> v1: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210127195600.23501-2-s-anna@ti.com/
> 
>  Documentation/devicetree/bindings/mailbox/omap-mailbox.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

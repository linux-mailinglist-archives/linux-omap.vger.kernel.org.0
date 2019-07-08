Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAB662C2C
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2019 00:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbfGHWyh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jul 2019 18:54:37 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44219 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfGHWyh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jul 2019 18:54:37 -0400
Received: by mail-io1-f66.google.com with SMTP id s7so38995366iob.11;
        Mon, 08 Jul 2019 15:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ycpHL4sbweieRz87Isn9PkqL7bhl0hfDPx3yX+jjAVA=;
        b=rJRAf35XeIjLxkuzPnG38K738pPWpsOafY2na63il/OAPLa94emDW80q6szkZjlVPp
         HhG9TqQMTN0gIVtNztN+xtCn2Urak1WSfdtE7hUcWqmKG3fipVWl7ezRPenZdcYqLCUV
         trcmkqPlEN/ES2BcG0eF7wcvFFmlbFZ8+69pkPuLH001afY0LgAApgu6bviAKPENRSGX
         BORxnXB8CNy3gRl3ZyZQ3ek3X9YgkIlLGBEY3G/BRnniyOWPviUOF7Y84xZ6I/kFYWRb
         E7gJYSpggCDJfwAC5X0+L3A7G3xleQm0Q3mbKKYmdvHruP2M9kbZO5iKCx43cY7aPA7W
         caow==
X-Gm-Message-State: APjAAAXMargcGxBWtsre06e2LRd+nOC7pn9uIQeOL0tCT06Xu+i1iBm1
        hkQSRMGVRIjlAUJ1UIuuwQ==
X-Google-Smtp-Source: APXvYqwhZ+6uIDGXwGK71Hxeb4xD4EDSKJ1wG2t6qeC7PmQXTgu9bkd/NfOlFZzmFDgL3K5q7QIbNg==
X-Received: by 2002:a5d:96d8:: with SMTP id r24mr20869180iol.269.1562626476112;
        Mon, 08 Jul 2019 15:54:36 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n21sm14107367ioh.30.2019.07.08.15.54.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 15:54:35 -0700 (PDT)
Date:   Mon, 8 Jul 2019 16:54:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: omap: Update bindings for TI
 K3 SoCs
Message-ID: <20190708225434.GA24701@bogus>
References: <20190604170146.12205-1-s-anna@ti.com>
 <20190604170146.12205-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604170146.12205-2-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 4 Jun 2019 12:01:45 -0500, Suman Anna wrote:
> The TI K3 AM65x and J721E family of SoCs have a new Mailbox IP that
> is based on the existing Mailbox IP present in OMAP architecture based
> SoCs. Update the existing OMAP Mailbox bindings for this new IP present
> on TI K3 AM65x and J721E SoCs. The same compatible from AM65x SoCs is
> reused for J721E SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  .../bindings/mailbox/omap-mailbox.txt         | 59 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

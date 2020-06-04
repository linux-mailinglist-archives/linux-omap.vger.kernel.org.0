Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634BD1EE44D
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jun 2020 14:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgFDMRu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Jun 2020 08:17:50 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:37112 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727944AbgFDMRu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 4 Jun 2020 08:17:50 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jgooV-0008BL-NF; Thu, 04 Jun 2020 22:17:40 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Thu, 04 Jun 2020 22:17:39 +1000
Date:   Thu, 4 Jun 2020 22:17:39 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [RESEND PATCHv3 0/7] crypto: omap: various fixes
Message-ID: <20200604121739.GA24286@gondor.apana.org.au>
References: <20200527122429.14888-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527122429.14888-1-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 27, 2020 at 03:24:22PM +0300, Tero Kristo wrote:
> Hi,
> 
> Resent the whole series as-per request. Only patch changed compared to
> v2 [1] is patch #3. Cache flushing logic has been fixed on it based on
> comments.
> 
> -Tero
> 
> [1] https://patchwork.kernel.org/cover/11540265/ 

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

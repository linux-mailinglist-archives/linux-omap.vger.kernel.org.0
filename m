Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DB325C60D
	for <lists+linux-omap@lfdr.de>; Thu,  3 Sep 2020 18:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgICQET (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Sep 2020 12:04:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:60756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727065AbgICQET (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Sep 2020 12:04:19 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 436B720829;
        Thu,  3 Sep 2020 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599149058;
        bh=GTA7nLGOuRGnaYqMiBhQJcR754KpBuAkgjzerzCpcWg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KmAYC9Umq1PjHaDgPe+K/fS3MPk+4Pe+PVCqDtaEaBDS5L6h4t8tzu2euja/fMWDF
         xzSJgUpu5KlnkxlBLH1moCGPXfKCfZXMonYF1PFGZ16qCvQzZDDv7gcAlqZ+ZXctOf
         triNkoo0PaQetAiFiB/g+98Xv9ItQlT3v0VtQHxs=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kDrii-008w85-JK; Thu, 03 Sep 2020 17:04:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Sep 2020 17:04:16 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>, kernel-team@android.com
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
In-Reply-To: <b378af0d-19a8-3d1b-5ca3-54ebccd77c9b@ti.com>
References: <20200727211008.24225-1-s-anna@ti.com>
 <0c1feaf91b9d285c1bded488437705da@misterjones.org>
 <74bc1f9f-cc48-cec9-85f4-3376b66b40fc@ti.com>
 <78b465b080772b6ba867e39a623c2310@kernel.org>
 <ef1931eb-5677-d92c-732d-b67b5263425d@ti.com>
 <0d43f357983711fcffce7023ad115d13@kernel.org>
 <b378af0d-19a8-3d1b-5ca3-54ebccd77c9b@ti.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <80600ff6d37712d15da906c24f761bfd@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: s-anna@ti.com, broonie@kernel.org, lee.jones@linaro.org, arnd@arndb.de, grzegorz.jaszczyk@linaro.org, david@lechnology.com, tony@atomide.com, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-09-03 14:25, Suman Anna wrote:
> On 9/3/20 3:26 AM, Marc Zyngier wrote:

[...]

>> Have we reached a conclusion here? Can we get a fix in mainline?
> 
> Marc, we can go with your patch based on Mark's response.

Patch resent[1].

         M.

[1] https://lore.kernel.org/r/20200903160237.932818-1-maz@kernel.org
-- 
Jazz is not dead. It just smells funny...

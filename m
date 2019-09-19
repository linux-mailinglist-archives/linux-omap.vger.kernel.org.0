Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E09B805E
	for <lists+linux-omap@lfdr.de>; Thu, 19 Sep 2019 19:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391109AbfISRr2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Sep 2019 13:47:28 -0400
Received: from verein.lst.de ([213.95.11.211]:43053 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391108AbfISRr2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Sep 2019 13:47:28 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1EB7868B20; Thu, 19 Sep 2019 19:47:25 +0200 (CEST)
Date:   Thu, 19 Sep 2019 19:47:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Keerthy <j-keerthy@ti.com>
Cc:     hch@lst.de, bjorn.andersson@linaro.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Suman Anna <s-anna@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Kristo, Tero" <t-kristo@ti.com>
Subject: Re: remoteproc: don't allow modular build
Message-ID: <20190919174724.GB9622@lst.de>
References: <5bf9425f-4ea0-09db-70cc-415ac0031b95@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bf9425f-4ea0-09db-70cc-415ac0031b95@ti.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 19, 2019 at 11:01:35AM +0530, Keerthy wrote:
> Hi Christoph/Bjorn,
>
> There are a bunch of defconfigs that rely on modular build of remoteproc.
>
> If i do a git grep CONFIG_REMOTEPROC on linux-next:
>
> arch/arm/configs/davinci_all_defconfig:CONFIG_REMOTEPROC=m
> arch/arm/configs/multi_v7_defconfig:CONFIG_REMOTEPROC=m
> arch/arm/configs/omap2plus_defconfig:CONFIG_REMOTEPROC=m
> arch/arm/configs/qcom_defconfig:CONFIG_REMOTEPROC=y
> arch/arm64/configs/defconfig:CONFIG_REMOTEPROC=m
>
> All of them now stop building the remoteproc as a module and all the 
> dependent modules consequently do not get built. Do you recommend all of 
> them to get converted to built in?

Yes, I guess we need to do that.

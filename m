Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFC9645D40
	for <lists+linux-omap@lfdr.de>; Wed,  7 Dec 2022 16:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiLGPHI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Dec 2022 10:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiLGPG5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Dec 2022 10:06:57 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 728A433E;
        Wed,  7 Dec 2022 07:06:55 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 985A8804D;
        Wed,  7 Dec 2022 15:06:54 +0000 (UTC)
Date:   Wed, 7 Dec 2022 17:06:53 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/2] memory: omap-gpmc: wait pin additions
Message-ID: <Y5CsDefg12Bbg24p@atomide.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
 <20221102133047.1654449-2-benedikt.niedermayr@siemens.com>
 <Y5CafQpZnjSSCMoj@atomide.com>
 <ae35cfd12ed3472df20ca5f99bffa8bb7c009199.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae35cfd12ed3472df20ca5f99bffa8bb7c009199.camel@siemens.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Niedermayr, BENEDIKT <benedikt.niedermayr@siemens.com> [221207 14:52]:
> Hi Tony,
> 
> On Wed, 2022-12-07 at 15:51 +0200, Tony Lindgren wrote:
> > Hi,
> > 
> > * B. Niedermayr <benedikt.niedermayr@siemens.com> [221102 13:21]:
> > > From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> > > 
> > > This patch introduces support for setting the wait-pin polarity as well
> > > as using the same wait-pin for different CS regions.
> > 
> > Looks like Linux next commit 89aed3cd5cb9 ("memory: omap-gpmc: wait pin
> > additions") breaks the old smsc911x using devices somehow for nfsroot.
> > 
> Can you explain how this breaking change looks like, in bit more detail?
> I'm a bit confused since the changes on omap-gpmc have nothing in common with
> smsc911x. 

The smsc911x device is on gpmc. It's not found with this change.
See arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi for the configuration.

Regards,

Tony

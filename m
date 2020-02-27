Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9927172AE5
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 23:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgB0WLQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 17:11:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50124 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgB0WLQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 17:11:16 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD822B16;
        Thu, 27 Feb 2020 23:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582841475;
        bh=2FZoe6ReTFNS++q1J/Dg78zwP8XhJ7io+zJtSBuCa4Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WEVJalX/OYJjO+qqnVzAajIWnb+YkQT0W0t5neafdXjrxBmJmU9+VpT9IZs8pciMf
         tNDot1hNVlu68g4Z2FC377jBP3eQ2D+4xBJk+G94ZP7mY403kScsIWcjtmvIFi1xs1
         6WUZq7XFpVFuLL16mRcCFuSufH+9G6svW+RtAf+s=
Date:   Fri, 28 Feb 2020 00:10:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 02/56] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200227221052.GC4959@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-3-sebastian.reichel@collabora.com>
 <20200224233708.GG16163@pendragon.ideasonboard.com>
 <20200224234759.GE37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200224234759.GE37466@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Mon, Feb 24, 2020 at 03:47:59PM -0800, Tony Lindgren wrote:
> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200224 23:38]:
> > On Tue, Feb 25, 2020 at 12:20:32AM +0100, Sebastian Reichel wrote:
> > > Add Droid 4 specific compatible value in addition to the
> > > generic one, so that we have the ability to add panel
> > > specific quirks in the future.
> > 
> > We need to document this compatible string in DT bindings, I don't think
> > this is included in this series. Furthermore, could we use a compatible
> > string that actually matches the panel vendor and model, instead of the
> > device name ?
> 
> To me it seems there are multiple similar panels from various
> vendors in use for xt875/xt894/xt910/xt912 phones, I'm not sure
> if anybody has this list?

Are they all truly compatible ?

-- 
Regards,

Laurent Pinchart

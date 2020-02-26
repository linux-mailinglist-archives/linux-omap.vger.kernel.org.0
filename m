Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031941707BA
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 19:31:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgBZSbg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 13:31:36 -0500
Received: from muru.com ([72.249.23.125]:57836 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726789AbgBZSbg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 13:31:36 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 10B788022;
        Wed, 26 Feb 2020 18:32:19 +0000 (UTC)
Date:   Wed, 26 Feb 2020 10:31:32 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>, Rob Herring <robh@kernel.org>
Cc:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: bus: ti-sysc: Add support for PRUSS
 SYSC type
Message-ID: <20200226183132.GV37466@atomide.com>
References: <20200225204649.28220-1-s-anna@ti.com>
 <20200225204649.28220-2-s-anna@ti.com>
 <96ec493b-3615-e84d-ba30-cabbf750c874@ti.com>
 <b35e278d-c3dd-3356-93c3-0511d3164d7a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b35e278d-c3dd-3356-93c3-0511d3164d7a@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200226 16:39]:
> Hi Roger,
> 
> On 2/26/20 2:42 AM, Roger Quadros wrote:
> > Hi Suman,
> > 
> > On 25/02/2020 22:46, Suman Anna wrote:
> >> From: Roger Quadros <rogerq@ti.com>
> >>
> >> The PRUSS module has a SYSCFG which is unique. The SYSCFG
> >> has two additional unique fields called STANDBY_INIT and
> >> SUB_MWAIT in addition to regular IDLE_MODE and STANDBY_MODE
> >> fields. Add the bindings for this new sysc type.
> >>
> >> Signed-off-by: Roger Quadros <rogerq@ti.com>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >>   Documentation/devicetree/bindings/bus/ti-sysc.txt | 1 +
> >>   include/dt-bindings/bus/ti-sysc.h                 | 4 ++++
> >>   2 files changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt
> >> b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> >> index 233eb8294204..c984143d08d2 100644
> >> --- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
> >> +++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> >> @@ -38,6 +38,7 @@ Required standard properties:
> >>           "ti,sysc-dra7-mcasp"
> >>           "ti,sysc-usb-host-fs"
> >>           "ti,sysc-dra7-mcan"
> >> +        "ti,sysc-pruss"
> >>     - reg        shall have register areas implemented for the
> >> interconnect
> >>           target module in question such as revision, sysc and syss
> >> diff --git a/include/dt-bindings/bus/ti-sysc.h
> >> b/include/dt-bindings/bus/ti-sysc.h
> > 
> > Did you intentionally leave this here? It should be part of 2nd patch?
> 
> No, not really, include/bindings are also considered part of bindings.
> This patch alone should be enough for you to add the DT nodes.

Well I don't care either way, sort of would prefer to have this
with the device patch in case somebody starts back porting
driver changes.

Anyways, let's wayt for Rob's ack on this, maybe he has also
preference on the ti-sysc.h changes.

Regards,

Tony

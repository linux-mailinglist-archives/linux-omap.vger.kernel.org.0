Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03B21FB164
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 14:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgFPM7U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 08:59:20 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52312 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgFPM7S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jun 2020 08:59:18 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05GCxA0H071268;
        Tue, 16 Jun 2020 07:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592312350;
        bh=8evmbhP5Jf5RxQdKLuOmw9nXtJEoicGR7KBBr/YO8+E=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=dgA/fvN6elTCoAjVGLSRvGQNUkXFHakk4Nrk4Xoo8natFKLyplDuMsmmNt7AIqKPK
         klXdm8RDyVAbzrPPGbUmfPTWGoJQ1o8Gdxk0tFfIMW1kV2w/gm1dsIH/ubxD6z/xY8
         GEciUhFQsgkF4ru72HHfUSNuAVR1/cUnOfyz0ifs=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05GCxAmi113502
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 16 Jun 2020 07:59:10 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 16
 Jun 2020 07:59:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 16 Jun 2020 07:59:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05GCx9h2029694;
        Tue, 16 Jun 2020 07:59:09 -0500
Date:   Tue, 16 Jun 2020 07:59:09 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Jagan Teki <jagan@amarulasolutions.com>
CC:     U-Boot-Denx <u-boot@lists.denx.de>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>,
        <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 12/23] logicpd: Drop omap3 zoom1
Message-ID: <20200616125909.cahrjlnxpe3e2tvw@akan>
References: <20200527125637.149189-1-jagan@amarulasolutions.com>
 <20200527125637.149189-13-jagan@amarulasolutions.com>
 <CAMty3ZBtysaorQW9Tn7gDUAFQUP0X+WCbrjaOuEH+18GwT892g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMty3ZBtysaorQW9Tn7gDUAFQUP0X+WCbrjaOuEH+18GwT892g@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23:45-20200613, Jagan Teki wrote:
> On Wed, May 27, 2020 at 6:27 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > OF_CONTROL, DM_SPI and other driver model migration deadlines
> > are expired for this board.
> >
> > Drop it.
> >
> > Cc: Nishanth Menon <nm@ti.com>
> 
> Any comments?
I think this should be fine. OMAP3 ES1.0 on which zoom1 was based on,
  has'nt had users for some time.

  If there are any specific user still wanting to keep this platform
  alive, please speak up.

-- 
Regards,
Nishanth Menon

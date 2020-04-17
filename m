Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECBF1AE104
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 17:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgDQPXj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 11:23:39 -0400
Received: from muru.com ([72.249.23.125]:49920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728376AbgDQPXi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 11:23:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7F05E8047;
        Fri, 17 Apr 2020 15:24:24 +0000 (UTC)
Date:   Fri, 17 Apr 2020 08:23:34 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Stefan Agner <stefan@agner.ch>, linux-omap@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Smith <Peter.Smith@arm.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Russell King <linux@armlinux.org.uk>, nd <nd@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
Message-ID: <20200417152334.GN37466@atomide.com>
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
 <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
 <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
 <DBBPR08MB4823129E272220712B470716F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>
 <CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com>
 <e0c125ea492670c7069c407b6b0c5958@agner.ch>
 <CAMj1kXEe835GbXU5qgX-QQ5n4SmwQO1nAoAZw5pUVCbR=J8XmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEe835GbXU5qgX-QQ5n4SmwQO1nAoAZw5pUVCbR=J8XmQ@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ard Biesheuvel <ardb@kernel.org> [200402 14:37]:
> On Thu, 2 Apr 2020 at 16:34, Stefan Agner <stefan@agner.ch> wrote:
> > Just to confirm: The instance at hand today seems to be working fine
> > without adrl, so I guess we are fine here, do you agree?
> >
> 
> I agree. Apologies for hijacking the thread :-)

Yes this seems to work just fine based on a quick test, will
be applying for v5.8.

Thanks,

Tony

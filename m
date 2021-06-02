Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA373980B0
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jun 2021 07:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhFBFjg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Jun 2021 01:39:36 -0400
Received: from muru.com ([72.249.23.125]:35184 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229654AbhFBFjg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Jun 2021 01:39:36 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AF0FB811B;
        Wed,  2 Jun 2021 05:38:00 +0000 (UTC)
Date:   Wed, 2 Jun 2021 08:37:50 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Mighty M <mightymb17@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: Regulators not working
Message-ID: <YLcZLnKcQw4yyJsJ@atomide.com>
References: <CACLAQJFXr2PeuV9rJtyVTB0ib9QgsHC7W14qA_aCm9qKh81JOA@mail.gmail.com>
 <CACLAQJEpPJJJWXQLq=wD5Zquw-c0wBFEBXTrZXm_-8R27LxfHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACLAQJEpPJJJWXQLq=wD5Zquw-c0wBFEBXTrZXm_-8R27LxfHA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mighty M <mightymb17@gmail.com> [210531 18:11]:
> On Thu, May 27, 2021 at 10:49 PM Mighty M <mightymb17@gmail.com> wrote:
> >
> > My device has twl6032 regulator, and the regulators are always
> > disabled and off, even after putting regulator-always-on in my dts
> > they are off. Only the twl regulators are affected, the ones i added
> > manually (ie fixed reg with gpio) are working fine. Here is my dts
> > https://pastebin.ubuntu.com/p/pYGG2pTSjB/, my .config
> > https://pastebin.ubuntu.com/p/vVFrbZ4773/  , my dmesg
> > https://pastebin.ubuntu.com/p/tqCXGnPZmF/ it says
> >
> > [    4.330841] VAUX2_6030: 2800 mV, disabled
> > [    4.334533] twl6030_reg 48070000.i2c:twl@48:regulator-vaux2: always-on 1
> >
> > and checking the /sys/class/regulator
> > samsung-espresso10:/sys/devices/platform/44000000.ocp/48000000.interconnect/48000000.interconnect:segment@0/48070000.target-module/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:regulator-vaux2/regulator/regulator.8#
> > cat state
> > disabled
> > samsung-espresso10:/sys/devices/platform/44000000.ocp/48000000.interconnect/48000000.interconnect:segment@0/48070000.target-module/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:regulator-vaux2/regulator/regulator.8#
> > cat status
> > off
> > the regulator_summary https://pastebin.ubuntu.com/p/3DH6h9bkGY/
> >
> > I cannot understand why the twl pmic isnt working, any help?
> 
> Fixed using twl6032 compatible regs
> (https://github.com/MightyM17/linux_openpvrsgx/commit/0941a578af14997bce809a490e3c4ad6974da30d#diff-064ed8561b0ba46b9cd9fb30b57da0d76f2609faeaf0df09bdb7b908ef87a363R342)

OK good to hear.

Regards,

Tony

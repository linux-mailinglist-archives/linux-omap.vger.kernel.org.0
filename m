Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 581668DECC
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 22:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfHNU2Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 16:28:25 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:42426 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfHNU2Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Aug 2019 16:28:25 -0400
Received: by mail-ed1-f48.google.com with SMTP id m44so359487edd.9
        for <linux-omap@vger.kernel.org>; Wed, 14 Aug 2019 13:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qLqQURwCR30ATyaZ3IymQvcdVRhQdSz4H7hnZmYK+F0=;
        b=IE9wb8GRGwauC0zwEJTj3a6Iq0FzH1yQkyyDnVN8v9gfSefHp9p+/Xjp/F+uFBDFdx
         svmBbJ5PF/Ge4JxhwzFmSzVSYrmlazyRDYpdje2pXn4IsRAzjdHjDuc6SgkBUM7Nr23D
         ouBR+foaGdt5ZQ8hok6NguqV19gJ4KzQBJhNDRXdhEJ+TWVaKbpw6fwh4dDnACk2aSfk
         +cT1U74VD2t7iZO+ubBDBPEtKZkDUBaQ225IeIHgdvG2/OHtKaBxhfTc2bGpxYDL4TtK
         JuFgLugteXs6IyV3TIqzqx4+v3fpDYZF+j9RBc1+pHIc2g059xAZEpO80Z5msGs3KOyC
         zbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qLqQURwCR30ATyaZ3IymQvcdVRhQdSz4H7hnZmYK+F0=;
        b=IXNeirS+YoIOBSe31ECgeNf3IuEMDGwwk2W9llj/VtTypR8kHtno5Kedd/KeYsjKLO
         oyBYobWYsQyybN2eMYx49NiLteisipLwRwbsdnAVzlgguPYpk0Q8oGQ6FFOWzp0tHiXJ
         rQHLWhCQbx9H5U6B5R8ozXbJI3ASiGCqQ4UXA2kbhcIRQsZMnad0qU5WqVS3SxURDaaq
         UT0dkreSebiAF1BldB2Mu2ZL0xrFOLaYFPcv94tSITEyPyBluYEpyBVoLlOELruVA+YT
         mCwRA8kgbFVGnszvp7GRekh0jO8Qpgiqq40+kb/dDndMlUosukZlyvLE6LyZXzVoHJui
         p1Yg==
X-Gm-Message-State: APjAAAU65RIEfiuujksVEwO3EDysf7G03NJDcMmvIDFdaNt6umVy46Xo
        k6u+/CVUUMU7Xvtz6h7vMtW+ILuUsnzXVtW6QNygYU1CQ3Bi9w==
X-Google-Smtp-Source: APXvYqzUQUdH3vzln2hOPpbu5+OFN7t9U1/wvqwi1HE0Bam0SAKG4KNsVhEnrILjRgkYzvg1+ILVq2z+B5UDcd1WE8s=
X-Received: by 2002:a50:9401:: with SMTP id p1mr1617844eda.189.1565814503313;
 Wed, 14 Aug 2019 13:28:23 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 14 Aug 2019 15:28:11 -0500
Message-ID: <CAHCN7xJXJ__Gm3x=eAKkXuRTi1tDJocddKUzSw8oeYXQzM4tuQ@mail.gmail.com>
Subject: omap36
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Logic PD Torpedo dm3730 boots with a few messages that concern me:

[    2.824188] omap2_set_init_voltage: unable to find boot up OPP for
vdd_mpu_iva
[    2.831481] omap2_set_init_voltage: unable to set vdd_mpu_iva
[    2.837280] omap2_set_init_voltage: unable to find boot up OPP for vdd_core
[    2.844329] omap2_set_init_voltage: unable to set vdd_core


and

[    7.664245] core: _opp_supported_by_regulators: OPP minuV: 1012500
maxuV: 1012500, not supported by regulator
[    7.674377] cpu cpu0: _opp_add: OPP not supported by regulators (300000000)
[    7.681640] core: _opp_supported_by_regulators: OPP minuV: 1200000
maxuV: 1200000, not supported by regulator
[    7.691650] cpu cpu0: _opp_add: OPP not supported by regulators (600000000)
[    7.698822] core: _opp_supported_by_regulators: OPP minuV: 1325000
maxuV: 1325000, not supported by regulator
[    7.708831] cpu cpu0: _opp_add: OPP not supported by regulators (800000000)

The current device tree shows the arm is powered by VCC.

cpus {
    cpu@0 {
    cpu0-supply = <&vcc>;
};

I noticed that abb_mpu_iva has a bunch of OPP's, but it's not clear to
me how or what should power this and/or how the regulator is is
related (if at all)

The torpedo is using the TWL4030 PMIC, and I would expect those
voltages to be acceptable to the twl4030

adam

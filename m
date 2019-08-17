Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86C3E91230
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 20:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfHQSTY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Aug 2019 14:19:24 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45388 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfHQSTY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 17 Aug 2019 14:19:24 -0400
Received: by mail-ed1-f68.google.com with SMTP id x19so7747998eda.12
        for <linux-omap@vger.kernel.org>; Sat, 17 Aug 2019 11:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4Zq+tFnMwb2gtAsHpdtwm0JNO0SPfA6LHnkY5EY27s=;
        b=Za/YA7zek+5ZztDFmIfgo7PQsP/odjpheL8StIBTB43v6MlEMG1qy37cOOE8w0jQca
         NQEH3MfxwMJ3C7jdxQpulHgx593kBfZ8u0N8BGRCTlTGpNliQen2bhcx+/W6S7syswu1
         Nn8yyz8Y70mEJWwtks1IoWfvzUCSdXBhOTBQTonvXNm8c7YzrzOO1sRAF1/c+XuPdvlt
         mzJO8f31bZdXtFY5WHBEOhMbtIFkmychLoBq1MdB9FiM+8VggSi73Gt7mz5bVtTAYUPx
         EzOr3e9qZ9xxtTgw7cgdvr77VbOdPRkKAMzFtxHFFWWZsgYijR+uIvXinEQwTAlSSFAb
         ETlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4Zq+tFnMwb2gtAsHpdtwm0JNO0SPfA6LHnkY5EY27s=;
        b=koEPMBxtGa7vc5gW2JvZuyJAkEoJESpzhx9bbu/Qrg+bZoXRMIFuMhRnECvVzRwtH/
         JlT/OFagkdVdnO4oub/YjWZxR1NBXNfM8bu2pf4GH0CcmAIpF8rC/oeksmbxk0SyMDPi
         vd6JmDm3qcnbD19ZvWAIk2kZbJf05G6Rdjatc8PSbi3rj3TuzM1xaUxWTuh0+Uvo3RUq
         u6Q8v4R22A31e7vsvs4wGvSf+Z96DxlNLZfLG+VZGKDVfDBS0TdIy2dXzHPZ5sJg0864
         smQLtWjsgUa9BS83MGEvWsE7GUtLVp6nLiNciX3NkRtV1uyVN7FIhO78mb+AWqhKYfXJ
         Gr2A==
X-Gm-Message-State: APjAAAV14JdJCd8GFj/0ZKOhjunUZHSJStI6R1uGV2n+o80gB6SDAj0T
        pq7Uog4wkqMgnhZmM/FVkP4=
X-Google-Smtp-Source: APXvYqyUoOUm0C+S7m7AmUwFNU7FpsVFGrqnSdc8Gy7DExCpkaw08vx9C/yeVYpXLdKG9V1uvkG6oQ==
X-Received: by 2002:a50:b875:: with SMTP id k50mr17228396ede.232.1566065962468;
        Sat, 17 Aug 2019 11:19:22 -0700 (PDT)
Received: from lepton (46.137.104.92.dynamic.wline.res.cust.swisscom.ch. [92.104.137.46])
        by smtp.gmail.com with ESMTPSA id oh24sm1299616ejb.35.2019.08.17.11.19.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 11:19:21 -0700 (PDT)
Date:   Sat, 17 Aug 2019 20:19:18 +0200
From:   =?UTF-8?B?QW5kcsOp?= Roth <neolynx@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] Enable 1GHz support on omap36xx
Message-ID: <20190817201918.7d3fc065@lepton>
In-Reply-To: <CAHCN7x+aAOOAik6QyAbhc0_Q_sDa3+Jh70vQBp=3CmAv-dLMdw@mail.gmail.com>
References: <20190801012823.28730-1-neolynx@gmail.com>
        <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
        <CAHCN7x+aAOOAik6QyAbhc0_Q_sDa3+Jh70vQBp=3CmAv-dLMdw@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi Adam,

> With this patch,
> 
> [    3.361358] omap2_set_init_voltage: unable to set vdd_mpu_iva
> [    3.367156] omap2_set_init_voltage: unable to find boot up OPP for vdd_core
> [    3.374206] omap2_set_init_voltage: unable to set vdd_core
> and
> [    3.414978] smartreflex 480cb000.smartreflex: omap_sr_probe:
> SmartReflex driver initialized
> [    3.423919] smartreflex 480c9000.smartreflex: omap_sr_probe:
> SmartReflex driver initialized
> 
> Is there anything I need to do to make it be able to set vdd_core
> and/or vdd_mpu_iva?

I think OPPs for vdd_core are missing in the device tree, only the
vdd_mpu_iva ones are defined in the CPU.

I did not find out yet how to configure them... and the current
drivers for VC and VP will probably change with the AVS device tree
implementation. This will also render my patches obsolete I think.

> I also applied which also fixed
> 
> https://patchwork.kernel.org/patch/11094653/
> 
> I should not that I am running an 800MHz version of the DM3730, but I
> have a 1000 MHz somewhere at work.  I wasn't sure if this is normal or
> if I needed to do something else.

AFAIK an internal calibration of the voltages should be
performed (i.e. at boot time) in order to ensure the correct voltages
are provided, which might change with temperature / silicon aging...
I guess this also applies if you run at 800MHz, but might be less
severe.

My patch only enables those drivers, but the calibration is not
actually done. A discussion off-list with TI has revealed some more
information, which we can share here soon...

Kind Regards,

 André

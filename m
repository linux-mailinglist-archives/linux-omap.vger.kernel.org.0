Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5742CDEB
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 19:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbfE1RsK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 13:48:10 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:41687 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfE1RsJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 13:48:09 -0400
Received: by mail-lj1-f169.google.com with SMTP id q16so1451782ljj.8
        for <linux-omap@vger.kernel.org>; Tue, 28 May 2019 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2b+zSBhPUFYF8TBcN9S0abTU+XNsI8SZLoQByKSROWg=;
        b=qX8y18Zy+GnzVQa2UigP1iRWt+eWH2IvHmgfCT3SGRK1RLT3u3ZkxEq5ulQl015/6P
         bcUK7u6Urwg/yga0aWUmCiP5HjwwCcK3HDZBnnUusAWTbUSRnskCM8K5qnGHLAYY+PrA
         u/pnUg2xKKJQ4RcCUv5FI2i4nW0K9pWMXuPllE+bBKuEHBS7oCDPM4pzYgPzhBhDJD9m
         KQW73mD4AnCgsoJ5Slg1aiDUBVeERnp6OLebxRK8m5r8o4uA3mRX7ycpaNylAoKcHs4U
         7lFasX2dOAzUNi6OAY8cPlSa3MwVIBFYDZjO5QxKDT61RGSN8CekqS0ZVu7I1iLlJAu8
         Sxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2b+zSBhPUFYF8TBcN9S0abTU+XNsI8SZLoQByKSROWg=;
        b=eZRQ3WApf1IHT0623SeUJuEXW5kNWTa+KLO5nRhgG5A45m+AZWNh5x87f3EfaXLgen
         3iE8Lw12Ux1Zg3Rs6TdWq3eVheB62ZK/g0GIcmNiZg7hovWYx3FYrh6ayM8Z6LtUrT7E
         Qg56o8QyD5/jQAx5lDXIaDfepOX62t0py2QJGttMBZ9C/rkbuqucDGdEjuGrzmhPyJ6O
         KYwBE5yDdgmrlWRkfUfCrGe+j5aLCOTDp4zKP9Srf/ePOEcz9k04ILw1rZpwrjRZH191
         WqhFM1kKylp3hClvjCP0uiW3CGxL/248tsG1FF5Ckbf6aZRmBcFyPDM/qO/s4uT+A2Zr
         7l9Q==
X-Gm-Message-State: APjAAAW3E+2FaVftePHbdCUyTb03Mqis5XEhkcxQrhNGmyXgMJx1cBSg
        TwK7r05CG9GowmtyWt1ZKJz9rAaurpg=
X-Google-Smtp-Source: APXvYqzGAfNp2urKxLyPkaIXh7rQVPVPHDYGjYpJ53BFyfb2W3CmKlz169LP2vWgEVFSJtyS7SBhfw==
X-Received: by 2002:a2e:818b:: with SMTP id e11mr65623965ljg.82.1559065687568;
        Tue, 28 May 2019 10:48:07 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id j7sm3641208lji.27.2019.05.28.10.48.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2019 10:48:07 -0700 (PDT)
Date:   Tue, 28 May 2019 20:48:05 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com
Cc:     davem@davemloft.net, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw: correct .ndo_open
 error path
Message-ID: <20190528174803.GA3233@khorivan>
Mail-Followup-To: grygorii.strashko@ti.com, davem@davemloft.net,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190528123352.21505-1-ivan.khoronzhuk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190528123352.21505-1-ivan.khoronzhuk@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Please ignore this version, I've sent version 2 that do the same but is more
adjustable for later on changes and based on usage counter.

-- 
Regards,
Ivan Khoronzhuk

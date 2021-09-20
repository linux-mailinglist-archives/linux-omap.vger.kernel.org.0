Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484AC4119E0
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 18:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhITQgn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 12:36:43 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54566 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229561AbhITQgm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 Sep 2021 12:36:42 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mSMG8-00036N-LX; Mon, 20 Sep 2021 19:35:12 +0300
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
Date:   Mon, 20 Sep 2021 19:35:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUiOA4QEbZXPmQ7F@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/20/21 4:34 PM, Tony Lindgren wrote:
> The patch below should take us back to the earlier configuration,
> can you please give it a try?
> 
I double checked and unfortunate it doesn't boot at all or give any
output when patch is applied:

## Booting kernel from Legacy Image at 80200000 ...

   Image Name:   Linux-5.15.0-rc1-00239-gd4d016ca

   Image Type:   ARM Linux Kernel Image (uncompressed)

   Data Size:    4756991 Bytes = 4.5 MiB

   Load Address: 80008000

   Entry Point:  80008000

   Verifying Checksum ... OK

   Loading Kernel Image ... OK



Starting kernel ...


I used the weekend's head d4d016caa4b8 ("alpha: move __udiv_qrnnd
library function to arch/alpha/lib/") in testing.

Jarkko

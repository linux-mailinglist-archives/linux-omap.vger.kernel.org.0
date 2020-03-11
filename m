Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B486C180D0A
	for <lists+linux-omap@lfdr.de>; Wed, 11 Mar 2020 01:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgCKA6o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 20:58:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:51967 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727648AbgCKA6o (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 20:58:44 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 17:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
   d="scan'208";a="321987068"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Mar 2020 17:58:42 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jBphp-000Fun-DH; Wed, 11 Mar 2020 08:58:41 +0800
Date:   Wed, 11 Mar 2020 08:57:57 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Jassi Brar <jaswinder.singh@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: [balbi-usb:testing/next 3/11]
 drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202003110854.PVZUBn32%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
head:   36d292c6ddd3248d5a8e465e51a4e3b76de93a91
commit: 0dac4567e8c4c4b3ba72d22ab6cd67267910d105 [3/11] usb: gadget: add udc driver for max3420
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-174-g094d5a94-dirty
        git checkout 0dac4567e8c4c4b3ba72d22ab6cd67267910d105
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/usb/gadget/udc/max3420_udc.c:555:41: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/max3420_udc.c:556:31: sparse: sparse: restricted __le16 degrades to integer
>> drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [assigned] [usertype] status @@    got  short [assigned] [usertype] status @@
   drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse:    expected unsigned short [assigned] [usertype] status
   drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse:    got restricted __le16 [usertype]
   drivers/usb/gadget/udc/max3420_udc.c:588:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/max3420_udc.c:602:32: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/gadget/udc/max3420_udc.c:631:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/max3420_udc.c:632:29: sparse: sparse: cast from restricted __le16
   drivers/usb/gadget/udc/max3420_udc.c:633:30: sparse: sparse: cast from restricted __le16

vim +570 drivers/usb/gadget/udc/max3420_udc.c

   538	
   539	static void max3420_getstatus(struct max3420_udc *udc)
   540	{
   541		struct max3420_ep *ep;
   542		u16 status = 0;
   543	
   544		switch (udc->setup.bRequestType & USB_RECIP_MASK) {
   545		case USB_RECIP_DEVICE:
   546			/* Get device status */
   547			status = udc->gadget.is_selfpowered << USB_DEVICE_SELF_POWERED;
   548			status |= (udc->remote_wkp << USB_DEVICE_REMOTE_WAKEUP);
   549			break;
   550		case USB_RECIP_INTERFACE:
   551			if (udc->driver->setup(&udc->gadget, &udc->setup) < 0)
   552				goto stall;
   553			break;
   554		case USB_RECIP_ENDPOINT:
   555			ep = &udc->ep[udc->setup.wIndex & USB_ENDPOINT_NUMBER_MASK];
   556			if (udc->setup.wIndex & USB_DIR_IN) {
   557				if (!ep->ep_usb.caps.dir_in)
   558					goto stall;
   559			} else {
   560				if (!ep->ep_usb.caps.dir_out)
   561					goto stall;
   562			}
   563			if (ep->halted)
   564				status = 1 << USB_ENDPOINT_HALT;
   565			break;
   566		default:
   567			goto stall;
   568		}
   569	
 > 570		status = cpu_to_le16(status);
   571		spi_wr_buf(udc, MAX3420_REG_EP0FIFO, &status, 2);
   572		spi_wr8_ack(udc, MAX3420_REG_EP0BC, 2, 1);
   573		return;
   574	stall:
   575		dev_err(udc->dev, "Can't respond to getstatus request\n");
   576		spi_wr8(udc, MAX3420_REG_EPSTALLS, STLEP0IN | STLEP0OUT | STLSTAT);
   577	}
   578	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
